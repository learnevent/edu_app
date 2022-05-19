## EduApp

An App that detects objects in Images. Works on Android & Web 

### Features
- Select Image from Gallery
- Upload Image for processing
- Identify objects in Image

### Installation
After cloning this repository, migrate to ```edu_app``` folder. Then, follow the following steps:
- Create Firebase project
- Configure Firebase on ```edu_app``` for Android and Web
- Create .env (see .env.example)
- Populate Firebase keys in .env
- Run your app:
```bash
  flutter pub get
  flutter run
  flutter run -d chrome --web-renderer html (to see the best output)
```

### Tech Stack
**Server**: Firebase Storage, Firebase Firestore
**Client**: Flutter, Provider