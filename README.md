# AI Perspectives Survey Suite

An interactive survey suite to explore perspectives on AI attitudes, policy, global governance, and labor economics. Built with React and Firebase for real-time data collection.

## 📋 What's Included

### Four Interactive Surveys

1. **AI Attitude Survey** (`ai-attitude-survey.html`)
   - Maps users on Doomer/Boomer × Accelerationist/Cautious dimensions
   - 15 questions, 9 archetypes

2. **AI Policy Survey** (`ai-policy-survey.html`)
   - Maps users on Open-Source/Closed-Source × Public Good/Privatized dimensions
   - 15 questions, 9 archetypes

3. **AI Global Governance Survey** (`ai-global-governance-survey.html`)
   - Maps users on National Sovereignty/Global Coordination × Competition/Cooperation dimensions
   - 15 questions, 9 archetypes

4. **AI Labor & Economics Survey** (`ai-labor-economics-survey.html`)
   - Maps users on Market Adjustment/Government Intervention × Income Focus/Work Preservation dimensions
   - 15 questions, 9 archetypes

### Home Page & Results

- **`index.html`** - Landing page showcasing all four surveys with descriptions and links
- **`results-dashboard.html`** - Live results dashboard showing all survey responses with visualizations

## 🚀 Quick Start

### Option 1: Test Locally (Easiest)

1. Open `index.html` in your web browser
2. Click any survey to try it out
3. Surveys work without Firebase configuration (data won't be saved)

### Option 2: Deploy Online (Recommended)

See **[DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)** for detailed instructions.

**Quick steps:**
1. Push to GitHub repository
2. Enable GitHub Pages in repository settings
3. Set up Firebase project (free tier)
4. Update Firebase config in all survey files
5. Your surveys are live!

## 🔧 Firebase Setup (For Data Collection)

Currently, all surveys have placeholder Firebase configs. To collect data:

1. Create a Firebase project at https://console.firebase.google.com/
2. Set up Firestore Database
3. Get your Firebase config
4. Replace the config in all 4 survey HTML files:

```javascript
// Find this in each survey file and replace with your values
const firebaseConfig = {
    apiKey: "YOUR-API-KEY",
    authDomain: "YOUR-PROJECT.firebaseapp.com",
    projectId: "YOUR-PROJECT-ID",
    storageBucket: "YOUR-PROJECT.appspot.com",
    messagingSenderId: "YOUR-SENDER-ID",
    appId: "YOUR-APP-ID"
};
```

5. Set Firestore security rules to allow writes:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /survey_responses/{document=**} {
      allow write: if true;
      allow read: if false;
    }
  }
}
```

## 📊 Data Structure

Each survey response saved to Firebase includes:

```javascript
{
  survey: "ai-attitude" | "ai-policy" | "ai-global-governance" | "ai-labor-economics",
  x: number,           // X-axis coordinate (-2 to 2)
  y: number,           // Y-axis coordinate (-2 to 2)
  archetype: string,   // Resulting archetype/persona name
  answers: object,     // Individual question responses
  totalQuestions: 15,
  questionsAnswered: number,
  timestamp: Timestamp
}
```

## 🎨 Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Interactive Results** - Visual 2D mapping with archetype descriptions
- **Progress Tracking** - Shows completion percentage
- **No Account Required** - Users can take surveys anonymously
- **Real-time Data Collection** - Responses saved to Firebase instantly
- **Intro Pages** - Educational quadrant diagrams before each survey

## 📁 File Structure

```
publicai/
├── index.html                           # Home page
├── results-dashboard.html              # Live results dashboard with visualizations
├── ai-attitude-survey.html             # Doomer/Boomer survey
├── ai-policy-survey.html               # Policy preferences survey
├── ai-global-governance-survey.html    # Governance survey
├── ai-labor-economics-survey.html      # Labor/economics survey
├── vaccine-confidence-interactive.html  # Vaccine confidence survey
├── deploy.sh                           # Deployment helper script
├── DEPLOYMENT_GUIDE.md                 # Detailed deployment instructions
└── README.md                           # This file
```

## 🔒 Privacy & Security

- No personal information is collected
- Survey responses are anonymous
- Data is write-only (users cannot read others' responses)
- Only you can view data via Firebase Console

## 💰 Cost

**Completely free for typical usage:**
- GitHub Pages: Free hosting
- Firebase Free Tier: Up to 20,000 survey responses per day
- No credit card required to get started

## 📈 Next Steps

1. ✅ Home page created
2. ✅ Firebase integration added to all surveys
3. ⏳ Deploy to GitHub Pages or Netlify
4. ⏳ Configure Firebase project
5. ⏳ Update Firebase configs in survey files
6. ⏳ Share survey URLs and collect responses!

## 🆘 Need Help?

Check out **DEPLOYMENT_GUIDE.md** for:
- Step-by-step deployment instructions
- Firebase configuration tutorial
- Troubleshooting common issues
- How to view and export data
- Cost estimates and limits

## 🛠️ Technical Details

- **Frontend**: React 18 (via CDN)
- **Styling**: Pure CSS with gradients and animations
- **Data Storage**: Firebase Firestore
- **Build Tools**: None required (Babel standalone for JSX)
- **Hosting**: Static files (GitHub Pages, Netlify, or any static host)

---

**Ready to launch?** Follow the [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) to get your surveys online!
