#!/usr/bin/bash
function check_bash_version() {
    #Requires version 4 for mapfile
    local required_version=4.0
    local current_version = $BASH_VERSION
    echo "$current_version"

    # Get the current Bash version
    if [[ -n "$BASH_VERSION" ]]; then
        current_version=$BASH_VERSION
    else
        current_version=$(bash --version | head -n 1 | awk '{ print $4 }')
    fi

    # Example: Check version (Placeholder for your logic)
    echo "Bash version is $current_version"
    # Convert version strings to numbers for comparison
   local required_version_num current_version_num
   required_version_num=$(echo "$required_version" | awk -F. '{ print ($1 * 10000) + ($2 * 100) + $3 }')
   current_version_num=$(echo "$current_version" | awk -F. '{ print ($1 * 10000) + ($2 * 100) + $3 }')

  # Compare versions
   if ((current_version_num < required_version_num)); then
    echo "Error: This script requires Bash version $required_version or higher."
    echo "Your current Bash version is number is $current_version."
    exit 1
   fi

} # <--- Ensure this closing brace exists!

check_bash_version

