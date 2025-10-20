#!/bin/bash

# Guruthwa Study Café - GitHub Pages Deployment Script
# This script prepares and deploys the website to GitHub Pages

echo "🚀 Guruthwa Study Café - GitHub Pages Deployment"
echo "=================================================="
echo ""

# Check if docs folder exists
if [ ! -d "docs" ]; then
    echo "❌ Error: docs folder not found!"
    echo "Please make sure you're in the repository root directory."
    exit 1
fi

echo "✅ docs folder found"
echo ""

# Check if .nojekyll exists
if [ ! -f "docs/.nojekyll" ]; then
    echo "⚠️  Creating .nojekyll file..."
    touch docs/.nojekyll
    echo "✅ .nojekyll created"
else
    echo "✅ .nojekyll file exists"
fi
echo ""

# Git operations
echo "📦 Preparing Git repository..."
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing Git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git repository already initialized"
fi
echo ""

# Add all files
echo "Adding files to Git..."
git add .
echo "✅ Files added"
echo ""

# Commit
read -p "Enter commit message (default: 'Deploy Guruthwa Study Café'): " commit_msg
commit_msg=${commit_msg:-"Deploy Guruthwa Study Café"}
git commit -m "$commit_msg"
echo "✅ Changes committed"
echo ""

# Set main branch
git branch -M main
echo "✅ Branch set to main"
echo ""

# Ask for remote URL
echo "📡 GitHub Repository Setup"
echo ""
read -p "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git): " repo_url

if [ -z "$repo_url" ]; then
    echo "⚠️  No repository URL provided. Skipping remote setup."
    echo ""
    echo "You can add it later with:"
    echo "  git remote add origin YOUR_REPO_URL"
    echo "  git push -u origin main"
else
    # Check if remote already exists
    if git remote | grep -q "^origin$"; then
        echo "Updating remote URL..."
        git remote set-url origin "$repo_url"
    else
        echo "Adding remote repository..."
        git remote add origin "$repo_url"
    fi
    echo "✅ Remote repository configured"
    echo ""
    
    # Push to GitHub
    read -p "Push to GitHub now? (y/n): " push_now
    if [ "$push_now" = "y" ] || [ "$push_now" = "Y" ]; then
        echo "Pushing to GitHub..."
        git push -u origin main
        echo "✅ Pushed to GitHub"
    else
        echo "⚠️  Skipping push. You can push later with: git push -u origin main"
    fi
fi

echo ""
echo "🎉 Deployment Preparation Complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Go to your GitHub repository"
echo "2. Navigate to Settings → Pages"
echo "3. Under 'Source', select:"
echo "   - Branch: main"
echo "   - Folder: /docs"
echo "4. Click Save"
echo "5. Wait a few minutes for deployment"
echo "6. Your site will be live at: https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/"
echo ""
echo "📞 Contact: 9778467700"
echo "📍 Location: URR14, Uppalam Road, Trivandrum"
echo ""
echo "✨ Happy deploying!"
