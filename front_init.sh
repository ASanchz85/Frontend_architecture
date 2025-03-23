#!/bin/bash

# Default path is the current directory
SCRIPT_DIR="."

for arg in "$@"; do
    case $arg in
        --path=*)
            SCRIPT_DIR="${arg#*=}"
            shift
            ;;
        *)
            if [ -d "$arg" ]; then
                SCRIPT_DIR="$arg"
                shift
            fi
            ;;
    esac
done

if [ ! -d "$SCRIPT_DIR" ]; then
    echo "❌ Error: The provided script path '$SCRIPT_DIR' does not exist."
    exit 1
fi

# Ensure all scripts are executabled
chmod +x "$SCRIPT_DIR"/front_large.sh "$SCRIPT_DIR"/front_midLarge.sh "$SCRIPT_DIR"/front_midSize.sh "$SCRIPT_DIR"/front_small.sh

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
        bash "$SCRIPT_DIR"/front_large.sh
        ;;
    2)
        echo "Initializing Mid-large size Project..."
        bash "$SCRIPT_DIR"/front_midLarge.sh
        ;;
    3)
        echo "Initializing Mid-size Project..."
        bash "$SCRIPT_DIR"/front_midSize.sh
        ;;
    4)
        echo "Initializing Small Project..."
        bash "$SCRIPT_DIR"/front_small.sh
        ;;
    5)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again and select a valid option."
        ;;
esac
