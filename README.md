# EduApp

An App that detects objects in Images. Works on Android & Web 

## Features
- Select Image from Gallery
- Upload Image for processing
- Identify objects in Image

## Tech Used
**Server**: Firebase Storage, Firebase Firestore (TODO: Add Firebase Auth)
**Client**: Flutter (TODO: Add Provider)

## Installation
After cloning this repository, migrate to ```edu_app``` folder. Then, follow the following steps:
- Create Firebase project (### TODO: Create Firebase dev/prod project)
- Enable Authentication
- Make Firestore Rules
- Create Android, iOS & Web Apps
- Create .env (see .env.example)
- Populate Firebase keys in .env

Run the following commands to run your app:
```bash
  flutter pub get
  flutter run
  flutter run -d chrome --web-renderer html (to see the best output)
```