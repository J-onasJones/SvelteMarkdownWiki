#!/bin/bash

# Define the directory path and GitHub repository URL
repo_dir=".md_compiler"
github_repo="https://github.com/J-onasJones/Markdown-Compiler.git"

# Define the input and output folders
input_folder="./src/routes/"
output_folder="./.src-routes-built/"

full_input_folder=$(readlink -f "$input_folder")
full_output_folder=$(readlink -f "$output_folder")

echo "Input folder: $full_input_folder"
echo "Output folder: $full_output_folder"

mkdir "$full_output_folder/"

# Check if the directory exists
if [ -d "$repo_dir" ]; then
  echo "Directory '$repo_dir' already exists."
else
  # Clone the GitHub repository if the directory doesn't exist
  git clone "$github_repo" "$repo_dir"
fi

# Check if the script you want to run exists in the repository
script_to_run="$repo_dir/compiler.sh"

if [ -f "$script_to_run" ]; then
  echo "Running the script '$script_to_run'..."
  # Run the script
  cd "$repo_dir"
  ./compiler.sh $full_input_folder $full_output_folder -s

  # Check the exit status of the script
  if [ $? -ne 0 ]; then
    echo "Error: The script '$script_to_run' exited with an error. Check the logs for more details."
    exit 1
  fi
else
  echo "Error: The script '$script_to_run' does not exist. Please rerun the command to redownload the repository."
  exit 1
fi

# Exit successfully if everything is completed
exit 0
