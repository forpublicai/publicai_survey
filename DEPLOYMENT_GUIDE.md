# AI Perspectives Survey Suite - Deployment Guide

## Quick Start: Deploy to GitHub Pages (Recommended)

GitHub Pages is the easiest way to deploy this survey suite. It's free and works perfectly for static HTML files.

### Steps:

1. **Create a GitHub Repository**
   ```bash
   cd /Users/ahnjili_harmony/Documents/publicai
   git init
   git add index.html ai-attitude-survey.html ai-policy-survey.html ai-global-governance-survey.html ai-labor-economics-survey.html vaccine-confidence-interactive.html README.md DEPLOYMENT_GUIDE.md
   git commit -m "Initial commit: AI survey suite"
   ```

2. **Create a new repository on GitHub.com**
   - Go to https://github.com/new
   - Name it (e.g., "ai-perspectives-survey")
   - Don't initialize with README
   - Create repository

3. **Push to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR-USERNAME/ai-perspectives-survey.git
   git branch -M main
   git push -u origin main
   ```

4. **Enable GitHub Pages**
   - Go to your repository settings
   - Scroll to "Pages" section
   - Source: Deploy from branch "main"
   - Folder: root
   - Save

5. **Access Your Site**
   - Your site will be live at: `https://YOUR-USERNAME.github.io/ai-perspectives-survey/`
   - Wait 2-3 minutes for initial deployment

## Alternative: Deploy to Netlify

Netlify offers more features and is also free for personal projects.

### Steps:

1. **Install Netlify CLI** (optional)
   ```bash
   npm install -g netlify-cli
   ```

2. **Deploy via Drag & Drop** (easiest)
   - Go to https://app.netlify.com/drop
   - Drag the entire `publicai` folder
   - Your site is live instantly

3. **Or Deploy via CLI**
   ```bash
   cd /Users/ahnjili_harmony/Documents/publicai
   netlify deploy --prod
   ```

4. **Custom Domain** (optional)
   - Netlify provides free subdomain: `your-site-name.netlify.app`
   - Can add custom domain in Netlify settings

## Data Collection Setup

The surveys now include Firebase integration for data collection. You need to:

### 1. Create Firebase Project

1. Go to https://console.firebase.google.com/
2. Click "Add project"
3. Name it (e.g., "ai-perspectives-survey")
4. Disable Google Analytics (optional)
5. Create project

### 2. Set Up Firestore Database

1. In Firebase console, go to "Firestore Database"
2. Click "Create database"
3. Start in **production mode** (we'll update rules)
4. Choose a location (e.g., us-central)

### 3. Update Firestore Rules

1. Go to "Firestore Database" > "Rules"
2. Replace with these rules (allows public viewing of results):
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /survey_responses/{document=**} {
      allow write: if true;  // Allow anyone to write responses
      allow read: if true;    // Allow anyone to read for results dashboard
    }
  }
}
```

**Note:** If you want results to be private (only you can see them via Firebase Console), use `allow read: if false;` instead. However, this will prevent the Results Dashboard from working for public visitors.

3. Publish rules

### 4. Get Firebase Config

1. Go to Project Settings (gear icon)
2. Scroll to "Your apps"
3. Click web icon (</>)
4. Register app (name: "AI Survey Suite")
5. Copy the `firebaseConfig` object

### 5. Update Survey Files

Replace the Firebase config in each survey HTML file (search for `// TODO: Replace with your Firebase config`):

```javascript
const firebaseConfig = {
  apiKey: "YOUR-API-KEY",
  authDomain: "YOUR-PROJECT.firebaseapp.com",
  projectId: "YOUR-PROJECT-ID",
  storageBucket: "YOUR-PROJECT.appspot.com",
  messagingSenderId: "YOUR-SENDER-ID",
  appId: "YOUR-APP-ID"
};
```

### 6. Deploy Updated Files

Push the updated files to GitHub or Netlify.

## Viewing Survey Data

### Via Results Dashboard (Recommended)

The survey suite now includes a **Results Dashboard** that visualizes all responses:

1. Navigate to `results-dashboard.html` on your deployed site
2. The dashboard displays:
   - Total response counts across all surveys
   - Interactive scatter plots showing where respondents landed
   - Most popular archetypes for each survey
   - Real-time updates as new responses come in

**Requirements:**
- Firebase must be configured with the same config in `results-dashboard.html`
- Firestore security rules must allow `read: true` for public viewing
- At least one survey response must exist to display data

### Via Firebase Console

1. Go to Firebase Console > Firestore Database
2. Browse the `survey_responses` collection
3. Each document contains:
   - Survey name
   - User's X/Y coordinates
   - Archetype result
   - Timestamp
   - Individual answers

### Export Data for Analysis

1. In Firestore, click on collection
2. Use Firebase CLI to export:
```bash
firebase firestore:export gs://YOUR-BUCKET/exports
```

Or use the Firebase Admin SDK to query and export to CSV/JSON.

## Monitoring Usage

### Firebase Usage Limits (Free Tier)

- **Firestore Writes**: 20,000/day
- **Firestore Reads**: 50,000/day
- **Storage**: 1 GB

This is plenty for a survey with moderate traffic (hundreds of responses per day).

### Analytics

Consider adding Google Analytics to track:
- Survey completion rates
- Drop-off points
- Traffic sources

Add this to the `<head>` of each HTML file:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## Custom Domain (Optional)

### GitHub Pages
- Add `CNAME` file with your domain
- Configure DNS with your registrar

### Netlify
- Go to Domain settings
- Add custom domain
- Follow DNS configuration instructions

## Troubleshooting

### CORS Issues
- GitHub Pages and Netlify handle CORS automatically
- If using custom server, add CORS headers

### Firebase Not Saving Data
- Check browser console for errors
- Verify Firestore rules allow writes
- Confirm Firebase config is correct

### Survey Not Loading
- Check browser console for errors
- Verify all HTML files are in root directory
- Test locally first (open index.html in browser)

## Cost Estimate

**Free tier is sufficient for most use cases:**
- GitHub Pages: Free forever
- Netlify: Free for personal projects
- Firebase: Free up to 20K writes/day

**If you exceed limits:**
- Firebase Blaze plan: Pay-as-you-go (~$0.18 per 100K writes)
- Netlify Pro: $19/month (100GB bandwidth)

## Security Considerations

- Survey responses are public write (anyone can submit)
- Only you can read via Firebase Console
- No authentication required to take surveys
- Data includes no personal information unless user provides it
- Consider adding rate limiting if you get spam submissions

## Next Steps

1. Deploy to GitHub Pages or Netlify
2. Set up Firebase project
3. Update Firebase config in survey files
4. Test submission on live site
5. Share survey URLs
6. Monitor responses in Firebase Console
