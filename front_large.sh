#!/bin/bash

echo "Current directory: $(pwd)"
read -p "Is this the correct directory? (Y/N): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "Initializing git repository..."
    git init
    git branch -M main

    echo "Copying .gitignore from template..."
    cp "$(dirname "$0")/template_gitignore" ./.gitignore

    read -p "Do you want to do a full installation using VITE? (Y/N): " vite
    if [[ "$vite" =~ ^[Yy]$ ]]; then
        echo "Initializing VITE installer..."
        npm create vite@latest .
        echo "VITE installer has been initialized."
    else
        echo "Skipping Vite configuration download."
    fi

    read -p "Do you want to download custom standard linting settings? (Y/N): " linting_confirm
    if [[ "$linting_confirm" =~ ^[Yy]$ ]]; then
        echo "Downloading custom linting settings..."
        curl -o eslint.config.js https://raw.githubusercontent.com/ASanchz85/JS-Utils/main/eslint.config.js
        echo "Linting settings downloaded as esllint.config.js"
    else
        echo "Skipping linting settings download."
    fi

    read -p "Do you want to download custom Vite configuration settings? (Y/N): " vite_confirm
    if [[ "$vite_confirm" =~ ^[Yy]$ ]]; then
        echo "Downloading custom Vite configuration..."
        curl -o vite.config.ts https://raw.githubusercontent.com/ASanchz85/JS-Utils/main/vite.config.ts
        echo "Vite configuration downloaded as vite.config.ts"
    else
        echo "Skipping Vite configuration download."
    fi
    
    if [ -d "src" ]; then
        BASE_DIR="src"
        echo "'src/' folder found. All folders will be placed inside it."
    else
        echo "'src/' folder not found. Creating it..."
        mkdir src
        BASE_DIR="src"
    fi

    echo "Creating folder structure..."

    folders=(
        "pages"
        "pages/__tests__"
        "shared"
        "theme"
        "features"
        "features/auth"
        "features/auth/components"
        "features/auth/hooks"
        "features/auth/services"
        "features/auth/context"
        "features/auth/helpers"
        "features/auth/types"
        "features/auth/__tests__"
        "theme/layout"
        "theme/layout/Navbar"
        "theme/layout/Sidebar"
        "theme/layout/PageWrapper"
        "theme/layout/Footer"
        "theme/layout/__tests__"
        "theme/templates"
        "theme/templates/auth"
        "theme/templates/modals"
        "theme/templates/toasts"
        "theme/templates/forms"
        "theme/templates/twoColumns"
        "theme/templates/__tests__"
        "theme/styles"
        "theme/ui"
        "theme/ui/Button"
        "theme/ui/Dropdown"
        "theme/ui/Input"
        "theme/ui/Avatar"
        "theme/ui/Badge"
        "theme/ui/Card"
        "theme/ui/Tooltip"
        "theme/ui/__tests__"
        "shared/assets"
        "shared/i18n"
        "shared/lib"
        "shared/lib/__tests__"
        "shared/utils"
        "shared/utils/__tests__"
        "shared/types"
        "shared/services"
        "shared/services/__tests__"
        "shared/routes"
        "shared/context"
        "shared/context/__tests__"
        "shared/hooks"
        "shared/hooks/__tests__"
        "shared/hoc"
        "shared/hoc/__tests__"
        "shared/globalStore"
        "shared/globalStore/__tests__"
        "shared/config"
        "shared/components"
        "shared/components/__tests__"
        "tests"
        "mocks"
    )

    for folder in "${folders[@]}"; do
        mkdir -p "$BASE_DIR/$folder"
        touch "$BASE_DIR/$folder/.gitkeep"
    done

    echo "Folders and gitkeeps files created successfully inside '$BASE_DIR'!"
    echo "Don't forget to link your remote repository with 'git remote add origin <repository-url>'"
    echo "Happy coding!"
else
    echo "Operation cancelled."
fi
