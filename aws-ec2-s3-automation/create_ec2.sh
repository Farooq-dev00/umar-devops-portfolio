
#!/bin/bash

AMI_ID="ami-0aba19e56f3eaec05"
INSTANCE_TYPE="t3.micro"
KEY_NAME="cloud-miseacademy"
SECURITY_GROUP="sg-03b8d8b586ee10dd1"
INSTANCE_NAME="day38"

# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --region eu-north-1 \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query "Instances[0].InstanceId" \
  --output text)

if [ $? -eq 0 ] && [ -n "$INSTANCE_ID" ]; then
    echo "✅ EC2 Instance Launched: $INSTANCE_NAME"
    echo "🆔 Instance ID: $INSTANCE_ID"
else
    echo "❌ Failed to launch EC2 instance."
    exit 1
fi