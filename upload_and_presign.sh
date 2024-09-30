#!/bin/bash

# Set variables
BUCKET_NAME="ds2022-dtv9vd"     # Your bucket name
FILE_PATH="google_logo.png"      # Your file path
EXPIRATION_TIME=604800           # Expiration time for presigned URL (7 days in seconds)

# Check if the file exists
if [ ! -f "google_logo.png" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Extract the file name from the file path
FILE_NAME=$(basename "google_logo.png")

# Upload the file to the S3 bucket
echo "Uploading $FILE_NAME to s3://ds2022-dtv9vd/"
aws s3 cp "google_logo.png" "s3://ds2022-dtv9vd/$FILE_NAME"

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully!"
else
  echo "File upload failed!"
  exit 1
fi

# Generate a presigned URL for the uploaded file
echo "Generating a presigned URL for $FILE_NAME with expiration of 7 days..."
PRESIGNED_URL=$(aws s3 presign "s3://ds2022-dtv9vd/$FILE_NAME" --expires-in $EXPIRATION_TIME)

# Check if the presigned URL was successfully generated
if [ $? -eq 0 ]; then
  echo "Presigned URL: $PRESIGNED_URL"
else
  echo "Failed to generate presigned URL!"
  exit 1
fi
# Your provided presigned URL
echo "Provided Presigned URL: https://ds2022-dtv9vd.s3.us-east-1.amazonaws.com/google_logo.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQSOI4MZTWCSQT5VI%2F20240930%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240930T202913Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=f8a3928c8c32859c1961fc4d524678e694ee2322b645715cea986d9c1a3a8855"

