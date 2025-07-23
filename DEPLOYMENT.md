# GitHub Pages Deployment Guide

## Current Configuration ✅
- ✅ Base path configured: `/Recipe-Generator`
- ✅ Homepage set in package.json
- ✅ Build scripts configured
- ✅ gh-pages package installed
- ✅ GitHub Actions workflow created

## Deployment Steps

### Method 1: Using npm scripts (Current setup)
```bash
npm run deploy
```

### Method 2: Using GitHub Actions (Recommended)
1. Push your changes to the main branch
2. Go to your GitHub repository
3. Navigate to Settings > Pages
4. Set Source to "GitHub Actions"
5. The workflow will automatically deploy on every push

## Troubleshooting White Page Issues

### 1. Check Browser Console
- Open Developer Tools (F12)
- Look for any JavaScript errors
- Check Network tab for failed resource loads

### 2. Verify GitHub Pages Settings
- Repository Settings > Pages
- Source should be set to either:
  - "Deploy from a branch" (gh-pages branch)
  - "GitHub Actions" (recommended)

### 3. Check Asset Paths
- All assets should load from `/Recipe-Generator/` path
- Built files should be in the `dist` folder

### 4. Cache Issues
- Hard refresh: Ctrl+Shift+R (or Cmd+Shift+R on Mac)
- Try incognito/private browsing mode

### 5. Repository Settings
- Make sure repository name matches exactly: `Recipe-Generator`
- Repository should be public

## Common Issues and Solutions

### Issue: White page with console errors
**Solution**: Check the browser console for specific error messages

### Issue: 404 errors for assets
**Solution**: Verify the `base` path in vite.config.js matches your repository name

### Issue: Page loads but features don't work
**Solution**: Check for API or environment variable issues

### Issue: Old version loads
**Solution**: Clear browser cache or wait a few minutes for GitHub Pages to update

## Build and Deploy Commands
```bash
# Build locally to test
npm run build

# Preview the build locally
npm run preview

# Deploy to GitHub Pages
npm run deploy
```

## Files Modified for GitHub Pages
- `vite.config.js` - Added base path
- `package.json` - Added homepage and deploy scripts
- `.github/workflows/deploy.yml` - GitHub Actions workflow
- `public/.nojekyll` - Prevents Jekyll processing
- `public/404.html` - SPA fallback route
