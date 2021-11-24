import os
import requests


url = "http://" + os.environ.get('SERVER_URL') + ':5000'

tags_response = requests.get(url + '/tags')
assert tags_response.status_code == 200

data = dict(tags_response.json())
assert 'ec2' in data
assert 's3' in data

assert data['ec2']['name'] == 'Flugel'
assert data['ec2']['owner'] == 'InfraTeam'
assert data['s3']['name'] == 'Flugel'
assert data['s3']['owner'] == 'InfraTeam'

shutdown_response = requests.get(url + '/shutdown')
assert tags_response.status_code == 200

data = shutdown_response.text
assert data == 'success'
