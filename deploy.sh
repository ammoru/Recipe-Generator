#!/bin/bash

# Recipe Generator Deployment Script
# This script handles deployment to both GitHub Pages and Vercel

echo "🍳 Recipe Generator Deployment Script"
echo "======================================"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository. Please run this script from the project root."
    exit 1
fi

# Function to deploy to GitHub Pages
deploy_github() {
    echo "🚀 Deploying to GitHub Pages..."
    npm run build:github
    if [ $? -eq 0 ]; then
        gh-pages -d dist
        if [ $? -eq 0 ]; then
            echo "✅ Successfully deployed to GitHub Pages!"
            echo "🌐 URL: https://ammoru.github.io/Recipe-Generator/"
        else
            echo "❌ Failed to deploy to GitHub Pages"
            exit 1
        fi
    else
        echo "❌ Build failed"
        exit 1
    fi
}

# Function to deploy to Vercel
deploy_vercel() {
    echo "🚀 Deploying to Vercel..."
    npm run build:vercel
    if [ $? -eq 0 ]; then
        vercel --prod
        if [ $? -eq 0 ]; then
            echo "✅ Successfully deployed to Vercel!"
        else
            echo "❌ Failed to deploy to Vercel"
            exit 1
        fi
    else
        echo "❌ Build failed"
        exit 1
    fi
}

# Main script logic
case "$1" in
    "github")
        deploy_github
        ;;
    "vercel")
        deploy_vercel
        ;;
    "both")
        deploy_github
        echo ""
        deploy_vercel
        ;;
    *)
        echo "Usage: $0 {github|vercel|both}"
        echo ""
        echo "Examples:"
        echo "  $0 github  # Deploy to GitHub Pages"
        echo "  $0 vercel  # Deploy to Vercel"
        echo "  $0 both    # Deploy to both platforms"
        exit 1
        ;;
esac

echo ""
echo "🎉 Deployment completed successfully!"
