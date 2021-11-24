import flask
from flask import jsonify
import boto3
import requests

app = flask.Flask(__name__)
app.config["DEBUG"] = True


def get_instance_id():
    """
    Retrieve instance id from metadata
    """
    response = requests.get('http://169.254.169.254/latest/meta-data/instance-id')
    return response.text


def get_region():
    """
    Retrieve region from metadata
    """
    response = requests.get('http://169.254.169.254/latest/dynamic/instance-identity/document')
    return response.json()['region']


@app.route('/tags', methods=['GET'])
def tags():
    region = get_region()
    ec2_data = s3_data = {}

    # retrieve ec2 tags
    ec2 = boto3.resource('ec2', region)
    instance = ec2.Instance(get_instance_id())
    for tag in instance.tags:
            ec2_data[tag['Key'].lower()] = tag['Value']

    # retrieve s3 tags
    s3 = boto3.client('s3', region)
    bucket_name = s3.list_buckets()['Buckets'][0]['Name']
    response = s3.get_bucket_tagging(Bucket=bucket_name)
    for tag in response['TagSet']:
        s3_data[tag['Key'].lower()] = tag['Value']

    data = {
        "ec2": ec2_data,
        "s3": s3_data,
    }
    return jsonify(data)


@app.route('/shutdown')
def shutdown():
    ec2 = boto3.client('ec2', get_region())
    ec2.stop_instances(InstanceIds=[get_instance_id()])
    return 'success'


if __name__ == "__main__":
    app.run()
