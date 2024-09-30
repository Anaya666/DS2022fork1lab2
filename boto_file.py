import boto3
import requests
import os

# Variables
bucket_name = "ds2022-dtv9vd"  # Your S3 bucket name
file_url = "https://media.giphy.com/media/4rL0k8t2mSmWbzO8fl/giphy.gif"  # URL to the GIF
object_name = "data.gif"  # Object name in S3
expires_in = 604800  # Presigned URL expiration time (7 days)

def fetch_file(url):
    """Fetch a file from a URL and save it locally."""
    response = requests.get(url)
    if response.status_code == 200:
        with open(object_name, 'wb') as file:
            file.write(response.content)
        print(f"File downloaded successfully: {object_name}")
    else:
        print(f"Failed to download file: {response.status_code}")
        exit(1)

def upload_to_s3(file_name, bucket, object_name):
    """Upload a file to S3."""
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(file_name, bucket, object_name)
        print(f"File uploaded successfully to s3://{bucket}/{object_name}")
    except Exception as e:
        print(f"Failed to upload file: {str(e)}")
        exit(1)

def generate_presigned_url(bucket, object_name, expires_in):
    """Generate a presigned URL for the S3 object."""
    s3_client = boto3.client('s3')
    try:
        response = s3_client.generate_presigned_url(
            'get_object',
            Params={'Bucket': bucket, 'Key': object_name},
            ExpiresIn=expires_in
        )
        print(f"Presigned URL: {response}")
    except Exception as e:
        print(f"Failed to generate presigned URL: {str(e)}")
        exit(1)

if __name__ == "__main__":
    fetch_file(file_url)
    upload_to_s3(object_name, bucket_name, object_name)
    generate_presigned_url(bucket_name, object_name, expires_in)

PRESIGNED_URL=https://ds2022-dtv9vd.s3.amazonaws.com/data.gif?AWSAccessKeyId=AKIAQSOI4MZTWCSQT5VI&Signature=ChP%2F5In4oEdxc%2BXywcGkJLrrd%2Fw%3D&Expires=1728336522
print(PRESIGNED_URL)

