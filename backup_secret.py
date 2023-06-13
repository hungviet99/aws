import boto3
import os, sys
import json


# Cross role to sub account and get session key of sub account
def cross_account(region, account_id, role_name):
    """
    This function performs cross account from share-service-account to aws other account
    Args:
        account_id (:obj:`str`, required)
        role_name (:obj:`str`, required)
    Returns:
        ACCESS_KEY, SECRET_KEY, SESSION_TOKEN: Using for login to account
    """

    session = boto3.Session(region_name=region)
    sts_connection = session.client('sts')
    subacct = sts_connection.assume_role(
        RoleArn=f"arn:aws:iam::{account_id}:role/{role_name}",
        RoleSessionName='ACMSession'
    )
    ACCESS_KEY = subacct['Credentials']['AccessKeyId']
    SECRET_KEY = subacct['Credentials']['SecretAccessKey']
    SESSION_TOKEN = subacct['Credentials']['SessionToken']
    return ACCESS_KEY, SECRET_KEY, SESSION_TOKEN


def read_sm_cert(client, secret_name):
    get_secret_value_response = client.get_secret_value(
        SecretId=secret_name
    )
    return get_secret_value_response


if __name__ == "__main__":
    region = str(os.environ['REGION'])
    aws_account_id = str(os.environ['AWS_ACCOUNT_ID'])
    secret_name = str(os.environ['SECRET_NAME'])
    role_name = str(os.environ['ROLE_NAME'])
    AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN = cross_account(
                                                                    region, 
                                                                    aws_account_id, 
                                                                    role_name
                                                                )
    session = boto3.Session(region_name=region,
                            aws_access_key_id=AWS_ACCESS_KEY_ID,
                            aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
                            aws_session_token=AWS_SESSION_TOKEN)
    client = session.client('secretsmanager')
    get_secret_value_response = read_sm_cert(client, secret_name)
    secret_value_data = json.dumps(get_secret_value_response)
    jsonFile = open("sm_data.json", "w")
    jsonFile.write(secret_value_data)
    jsonFile.close()