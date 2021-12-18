import json
import boto3

region = 'us-east-2'
ec2 = boto3.clinet('ec2', region_name=region)


def lambda_handler(event, context):
    instances = event["instances"].split(',')
    action = event["action"]
    
    if action == 'Start':
        print("starting instance: " + str(instances))
        ec2.start_intances(InstanceIds=instances)
        response = "Successfully started instances: " + str(instances)
    elif action == 'Stop':
       print("stoping instance: " + str(instances))
        ec2.start_intances(InstanceIds=instances)
        response = "Successfully stopped instances: " + str(instances)
    
  
    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }
