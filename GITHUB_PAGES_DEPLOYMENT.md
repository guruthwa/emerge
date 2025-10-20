# GitHub Pages Deployment Guide for Guruthwa Study Café Website

## 📋 Overview
This guide will help you deploy the Guruthwa Study Café website to GitHub Pages.

## 🚀 Quick Deployment Steps

### Your Repository Details
- **GitHub URL**: https://github.com/guruthwa/emerge
- **Live Site**: https://guruthwa.github.io/emerge/

### Method 1: Deploy from `build` folder (Already Configured)

1. **Push your repository to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Guruthwa Study Cafe website"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git push -u origin main
   ```

2. **Copy the build folder contents**
   - Navigate to `/app/frontend/build/` directory
   - Copy all files from the build folder

3. **Create a `docs` folder in your repository root** (or use gh-pages branch)
   ```bash
   mkdir docs
   cp -r /app/frontend/build/* docs/
   ```

4. **Commit and push the docs folder**
   ```bash
   git add docs/
   git commit -m "Add built website for GitHub Pages"
   git push origin main
   ```

5. **Enable GitHub Pages**
   - Go to your GitHub repository
   - Click on **Settings** → **Pages**
   - Under "Source", select **Deploy from a branch**
   - Choose **main** branch and **/docs** folder
   - Click **Save**
   - Your site will be published at: `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/`

### Method 2: Using gh-pages branch

1. **Install gh-pages package** (if not already installed)
   ```bash
   cd /app/frontend
   yarn add -D gh-pages
   ```

2. **Update package.json** with homepage
   ```json
   {
     "homepage": "https://YOUR_USERNAME.github.io/YOUR_REPO_NAME",
     "scripts": {
       "predeploy": "yarn build",
       "deploy": "gh-pages -d build"
     }
   }
   ```

3. **Deploy**
   ```bash
   yarn deploy
   ```

## 📁 File Structure for GitHub Pages

```
your-repo/
├── docs/                          # Built files for GitHub Pages
│   ├── index.html
│   ├── .nojekyll                 # Prevents Jekyll processing
│   ├── static/
│   │   ├── css/
│   │   └── js/
│   └── asset-manifest.json
├── frontend/                      # Source code (optional to include)
│   ├── src/
│   ├── public/
│   └── package.json
└── README.md
```

## 🔧 Important Configuration

### .nojekyll File
The `.nojekyll` file has been created in the build folder. This tells GitHub Pages not to process your files with Jekyll, which is important for React apps.

### Custom Domain (Optional)
If you want to use a custom domain:
1. Create a file named `CNAME` in the `docs` folder
2. Add your domain name (e.g., `www.guruthwastudycafe.com`)
3. Configure your domain's DNS settings to point to GitHub Pages

## ✅ Built Website Features

All features are included in the static build:
- ✅ Newspaper-themed design
- ✅ Responsive mobile layout
- ✅ Three pricing plans (Pratham, Madhyam, Uttam)
- ✅ Call and WhatsApp buttons
- ✅ All 12 facility features
- ✅ FAQ section
- ✅ Contact information
- ✅ Smooth animations and interactions

## 📱 Contact Actions Work on GitHub Pages

The following interactions work perfectly on GitHub Pages:
- **Call Button**: Opens phone dialer with `tel:9778467700`
- **WhatsApp Button**: Opens WhatsApp with pre-filled message
- **Navigation**: Smooth scroll to sections
- **Accordion**: FAQ expand/collapse

## 🔍 Troubleshooting

### Issue: Blank page after deployment
**Solution**: Make sure the homepage field in package.json matches your GitHub Pages URL.

### Issue: 404 errors for CSS/JS files
**Solution**: Ensure `.nojekyll` file is present in the deployed folder.

### Issue: Changes not reflecting
**Solution**: 
- Clear browser cache (Ctrl+Shift+R or Cmd+Shift+R)
- Wait a few minutes for GitHub Pages to rebuild
- Check GitHub Actions tab for deployment status

## 📞 Website Contact Information

- **Phone**: 9778467700
- **Address**: URR14, Uppalam Road, Two Buildings After BSNL Bhavan, Trivandrum
- **Hours**: 7 AM - 12 AM Daily

## 🎨 Customization

If you need to make changes:
1. Edit files in `/app/frontend/src/`
2. Run `yarn build` to create new build
3. Copy contents of `build/` to `docs/`
4. Commit and push changes

---

**Built with React + Tailwind CSS**
**Designed with newspaper theme aesthetic**
**Fully responsive and mobile-optimized**
