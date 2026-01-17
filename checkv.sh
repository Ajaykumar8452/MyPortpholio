#!/usr/bin/bash
function check_bash_version() {
    #Requires version 4 for mapfile
    local required_version=4.0
    local current_version = echo "$BASH_VERSION"
#    echo "$current_version"

    # Get the current Bash version
    if [[ -n "$BASH_VERSION" ]]; then
        current_version=$BASH_VERSION
	echo "From IF Lopp: $current_version"
    else
        current_version=$(bash --version | head -n 1 | awk '{ print $4 }')
	echo "From Else Loop: $current_version"
    fi
}

function checkAWSCli()
{
    if command -v aws &> /dev/null
    then
        echo "Please Insatll AWS CLI in your Linux Machin"
        return 1:
    else
        echo "AWS CLI is already there in your machine....!!"
        return 1:
    fi
}

checkAWSCli


