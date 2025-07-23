# Recipe Generator Deployment Script (PowerShell)
# This script handles deployment to both GitHub Pages and Vercel

Write-Host "🍳 Recipe Generator Deployment Script" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: Not in a git repository. Please run this script from the project root." -ForegroundColor Red
    exit 1
}

# Function to deploy to GitHub Pages
function Deploy-GitHub {
    Write-Host "🚀 Deploying to GitHub Pages..." -ForegroundColor Yellow
    npm run build:github
    if ($LASTEXITCODE -eq 0) {
        gh-pages -d dist
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Successfully deployed to GitHub Pages!" -ForegroundColor Green
            Write-Host "🌐 URL: https://ammoru.github.io/Recipe-Generator/" -ForegroundColor Cyan
        } else {
            Write-Host "❌ Failed to deploy to GitHub Pages" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "❌ Build failed" -ForegroundColor Red
        exit 1
    }
}

# Function to deploy to Vercel
function Deploy-Vercel {
    Write-Host "🚀 Deploying to Vercel..." -ForegroundColor Yellow
    npm run build:vercel
    if ($LASTEXITCODE -eq 0) {
        vercel --prod
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Successfully deployed to Vercel!" -ForegroundColor Green
        } else {
            Write-Host "❌ Failed to deploy to Vercel" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "❌ Build failed" -ForegroundColor Red
        exit 1
    }
}

# Main script logic
switch ($args[0]) {
    "github" {
        Deploy-GitHub
    }
    "vercel" {
        Deploy-Vercel
    }
    "both" {
        Deploy-GitHub
        Write-Host ""
        Deploy-Vercel
    }
    default {
        Write-Host "Usage: .\deploy.ps1 {github|vercel|both}" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Examples:" -ForegroundColor Yellow
        Write-Host "  .\deploy.ps1 github  # Deploy to GitHub Pages" -ForegroundColor White
        Write-Host "  .\deploy.ps1 vercel  # Deploy to Vercel" -ForegroundColor White
        Write-Host "  .\deploy.ps1 both    # Deploy to both platforms" -ForegroundColor White
        exit 1
    }
}

Write-Host ""
Write-Host "🎉 Deployment completed successfully!" -ForegroundColor Green
