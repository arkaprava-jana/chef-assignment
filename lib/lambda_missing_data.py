import json
import boto3
from datetime import datetime,timedelta
from urllib.request import Request, urlopen



s3bucket = "${bucket_name}"
sftpserverid = "${sftp_server_id}"
SLACK_CHANNEL = "${slack_ch}"

daily_users =[]

def bucket_last_modified(bucket_name: str, foldername: str) -> datetime:
    s3 = boto3.resource('s3')
    bucket = s3.Bucket(bucket_name)
    objects = list(bucket.objects.filter(Prefix=foldername))
    try:
        return max(obj.last_modified for obj in objects)
    except:
        print("No Objects in path")
        return None
    
def lambda_handler(event, context):
    ssm = boto3.client('ssm')
    parameter = ssm.get_parameter(Name='slackwebhook', WithDecryption=True)
    hook_url=parameter['Parameter']['Value']
    
    client = boto3.client('transfer')
    transfer_response = client.list_users(ServerId=sftpserverid)
    transfer_result = transfer_response['Users']
    while "NextToken" in transfer_response:
        transfer_response = client.list_users(ServerId=sftpserverid, NextToken=transfer_response["NextToken"])
        transfer_result.extend(transfer_response["Users"])
    
    for user in transfer_result:
        user_details =client.describe_user(ServerId=sftpserverid,UserName=user['UserName'])
        if len(user_details['User']['Tags']) > 36:
            for tag in user_details['User']['Tags']:
                if tag['Key'] == "UPLOAD_FREQUENCY" and tag['Value'] == "daily":
                    daily_users.append(user_details['User']['UserName'])
        
    for user in daily_users:
        naive = bucket_last_modified(s3bucket,user).replace(tzinfo=None)
        time_between_insertion = datetime.now() - naive
        hrs_from_last_upload = time_between_insertion.seconds//3600
        if hrs_from_last_upload > 36:
            try:
                slack_message = { 'channel': SLACK_CHANNEL, 'text': "There has been no upload from %s in last %s hours" % (user,hrs_from_last_upload) }
                req = Request(hook_url, json.dumps(slack_message).encode('utf-8'))
                response = urlopen(req)
                response.read()
            except:
                print("Slack Config is not working")
            
            sns_client = boto3.client('sns')
            sns_response = sns_client.publish(TopicArn="${topic_arn}", Message=slack_message['text'])
            print(sns_response)