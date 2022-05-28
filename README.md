## EduApp

An App that detects image labels. Works on Android & Web 

### Features
- [x] Select image from gallery/camera
- [x] Process with ML_kit to label and detect objects
- [x] Filter and display response
- [x] UI modifications

### Installation
After cloning this repository, migrate to ```edu_app``` folder. Then, follow the following steps:
- Setup Firebase project | [example 1](https://www.youtube.com/watch?v=EXp0gq9kGxI) | [example 2](https://www.youtube.com/watch?v=LnpGU8vj7TI) 
    - Create Firebase project
    - Configure Firebase on ```edu_app``` for Android and Web
- Optional: Setup enviroment variables | [example](https://youtu.be/xTxwjbcd8kA)
    - Create .env (see .env.example)
    - Populate Firebase keys in .env
- Run your app:
```bash
  flutter pub get
  flutter run
  flutter run -d chrome --web-renderer html (to see the best output)
```

### Tech Stack
**Server**:
- Firebase: [intro](https://youtu.be/EXp0gq9kGxI) | [docs](https://firebase.google.com/docs?authuser=1&hl=en)

**Client**: 
- Flutter (cross-platform UI development kit create by Google): [intro](https://youtu.be/l-YO9CmaSUM) | [docs](https://docs.flutter.dev/) 
- ML Kit (machine learning kit for mobile app created by Google): [intro](https://youtu.be/CQ8iEqblWtY) | [docs](https://developers.google.com/ml-kit/) 