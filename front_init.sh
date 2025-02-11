#!/bin/bash

# Ensure all scripts are executabled
chmod +x front_large.sh front_midLarge.sh front_midSize.sh front_small.sh

# Display menu options
echo "Select the project architecture to initialize:"
echo "1) Large Project"
echo "2) Mid-large Project"
echo "3) Mid-size Project"
echo "4) Small Project"
echo "5) Exit"

# Read user choice
read -p "Enter your choice (1-5): " choice

# Execute the selected script
case $choice in
    1)
        echo "Initializing Large Project..."
        bash ./front_large.sh
        ;;
    2)
        echo "Initializing Mid-large size Project..."
        bash ./front_midLarge.sh
        ;;
    3)
        echo "Initializing Mid-size Project..."
        bash ./front_midSize.sh
        ;;
    4)
        echo "Initializing Small Project..."
        bash ./front_small.sh
        ;;
    5)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again and select a valid option."
        ;;
esac
