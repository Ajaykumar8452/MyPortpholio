#!/usr/bin/bash
set -euo pipefail


#Checking AWS CLI in your Machine

function checkAWSCli()
{
    if ! command -v aws &> /dev/null
    then
        echo "Please Insatll AWS CLI in your Linux Machin"
        exit 1
    else
        echo "AWS CLI is already there in your machine....!!"
        return 0
    fi
}

<< comment
function installAWSCli()
{
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        echo "AWS CLI is installed Successfully......"
        echo "The version is: '$(aws --version)"
}
comment


#This function will check state of the instance.
function wait_for_instance()
{
    local instance_id="$1"
    echo "Lets await for your $instance_id to run the it....."
    while true;
    do
        current_state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$current_state" == "running" ]]
        then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}


#This funcrion will create the EC2 instance.
function create_ec2_instance()
{
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local security_group_id="$4"
    local subnet_id="$5"
    local instance_name="$6"

    #Runing the AWS CLI command for creating the AWS EC2 instance
    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --security-group-ids "$security_group_id" \
        --subnet-id "$subnet_id" \
        --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$instance_name}]" \
        --query "Instances[0].InstanceId" \
        --output text
    )

    if [[ -z "$instance_id" ]]
    then
        echo "Failed to create EC2 Instance" >&2
        exit 1
    fi

    echo "Instance $instance_id created successfully..!!"

    #Wait for instnace to be running state

    wait_for_instance "$instance_id"
}

main()
{
    checkAWSCli
    echo "Creating EC2 instance......."
    AMI_ID="ami-02b8269d5e85954ef"
    INSTANCE_TYPE="t3.micro"
    KEY_NAME="aws-login"
    SUBNET_ID="subnet-0f7c00ad16f99af50"
    SECURITY_GROUP_IDS="sg-09916b3e9626ce667"  # Add your security group IDs separated by space
    INSTANCE_NAME="Linux-Server"

    # Call the Creare EC2 Function

    create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SECURITY_GROUP_IDS" "$SUBNET_ID" "$INSTANCE_NAME"

    echo "EC2 instance creation completed."
}

main "$@"

