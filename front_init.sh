#!/bin/bash

# Ask if the current directory is correct
echo "Current directory: $(pwd)"
read -p "Is this the correct directory? (Y/N): " confirm

# Convert the input to lowercase and check if it's a positive response
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Step 1: Initialize git repository
    echo "Initializing git repository..."
    git init

    # Step 2: Copy template_gitignore to .gitignore
    echo "Copying .gitignore from template..."
    cp "$(dirname "$0")/template_gitignore" ./.gitignore

    # Step 3: Ask if the user wants to download custom linting settings
    read -p "Do you want to download custom standard linting settings? (Y/N): " linting_confirm
    if [[ "$linting_confirm" =~ ^[Yy]$ ]]; then
        echo "Downloading custom linting settings..."
        curl -o eslint.config.js https://raw.githubusercontent.com/ASanchz85/JS-Utils/main/eslint.config.js
        echo "Linting settings downloaded as esllint.config.js"
    else
        echo "Skipping linting settings download."
    fi

    # Step 4: Ask if the user wants to download Vite configuration
    read -p "Do you want to download custom Vite configuration settings? (Y/N): " vite_confirm
    if [[ "$vite_confirm" =~ ^[Yy]$ ]]; then
        echo "Downloading custom Vite configuration..."
        curl -o vite.config.ts https://raw.githubusercontent.com/ASanchz85/JS-Utils/main/vite.config.ts
        echo "Vite configuration downloaded as vite.config.ts"
    else
        echo "Skipping Vite configuration download."
    fi

    # Step 5: Create folder structure
    echo "Creating folder structure..."

    # Define the folders based on the tree structure you provided
    folders=(
        "pages"
        "shared"
        "theme"
        "theme/layout"
        "theme/layout/components/Navbar"
        "theme/layout/components/Footer"
        "theme/layout/mainLayout"
        "shared/utils"
        "shared/types"
        "shared/services"
        "shared/routes"
        "shared/hooks"
        "shared/hoc"
        "shared/helpers"
        "shared/globalStore"
        "shared/config"
        "shared/components"
        "theme/styles"
    )

    # Loop through the folder list and create each one
    for folder in "${folders[@]}"; do
        mkdir -p "$folder"
        # Create an empty index.ts file in each folder
        touch "$folder/index.ts"
    done

    mv pages shared theme src/

    echo "Folders and index.ts files created successfully!"
else
    echo "Operation cancelled."
fi
