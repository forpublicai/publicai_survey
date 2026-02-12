#!/bin/bash

# AI Perspectives Survey Suite - Quick Deploy Script
# This script helps you deploy your surveys to GitHub Pages

echo "🚀 AI Perspectives Survey Suite - Deploy Script"
echo "================================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git initialized"
    echo ""
fi

# Add all survey files
echo "📝 Adding survey files to git..."
git add index.html \
    results-dashboard.html \
    ai-attitude-survey.html \
    ai-policy-survey.html \
    ai-global-governance-survey.html \
    ai-labor-economics-survey.html \
    vaccine-confidence-interactive.html \
    README.md \
    DEPLOYMENT_GUIDE.md

echo "✅ Files added"
echo ""

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo "ℹ️  No changes to commit"
else
    echo "💾 Creating commit..."
    git commit -m "Add AI Perspectives Survey Suite

- Home page with all 4 surveys
- AI Attitude Survey (Doomer/Boomer)
- AI Policy Survey (Open/Closed, Public/Private)
- AI Global Governance Survey (Sovereignty/Global, Competition/Cooperation)
- AI Labor & Economics Survey (Market/Government, Income/Work)
- Firebase integration for data collection
- Responsive design with React

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
    echo "✅ Commit created"
fi

echo ""
echo "📋 Next Steps:"
echo "1. Create a new repository on GitHub: https://github.com/new"
echo "2. Run these commands (replace YOUR-USERNAME and REPO-NAME):"
echo ""
echo "   git remote add origin https://github.com/YOUR-USERNAME/REPO-NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages in your repository settings"
echo "4. Your surveys will be live at: https://YOUR-USERNAME.github.io/REPO-NAME/"
echo ""
echo "📚 For Firebase setup, see DEPLOYMENT_GUIDE.md"
echo ""
echo "✨ Done!"
