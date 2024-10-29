# FlutterConf Latam 2024: Accessibility in Flutter

Welcome to the Accessibility in Flutter demo app! This repository showcases how to implement accessibility (A11Y) in Flutter applications, covering key aspects such as screen readers, semantic widgets, font sizes, and contrast.

## Table of Contents

- Overview
- Getting Started
- Running the App
- Key Features

## Overview

This app is designed to demonstrate accessible practices in Flutter, presented at FlutterConf Latam 2024. You can explore different versions of the app:

- `no-accessibility` branch: Initial version without accessibility improvements.
- `flutter-conf-latam` branch: Enhanced version with full accessibility features implemented.

## Getting Started

### Prerequisites
- Flutter SDK: Install Flutter
- Dart: Included with Flutter
- Git: Install Git

### Clone the Repository

```bash
git clone https://github.com/enzoftware/flutterconflatam_accesibility.git
cd flutterconflatam_accesibility
```

## Running the App

Ensure you’re in the correct directory:

```bash
cd flutterconflatam_accesibility
flutter pub get
flutter run
```


Each branch highlights different stages of accessibility enhancements. Start with `no-accessibility` to see the app before accessibility improvements, then switch to `flutter-conf-latam` to see the accessible version.

## Key Features

### Accessibility Enhancements

- Screen Readers: Implemented Semantics widgets to provide labels and descriptions for screen readers (TalkBack on Android, VoiceOver on iOS).
- Font Sizes: Adheres to WCAG recommended minimum font sizes and supports large text configurations to prevent overflow.
- Contrast: Uses sufficient color contrast for readability, verified with contrast checking tools.
- Semantic Widgets: Includes widgets like MergeSemantics and ExcludeSemantics for better screen reader navigation.
- Testing Tools: Added unit tests to check against accessibility guidelines (androidTapTargetGuideline, textContrastGuideline, etc.).
- Bonus: Accessibility testing in Flutter web using the following command: `flutter run -d chrome --profile --dart-define=FLUTTER_WEB_DEBUG_SHOW_SEMANTICS=true`



## Conclusion

Implementing accessibility in Flutter is simple and powerful, expanding your app’s usability to a wider audience. Explore the different branches to understand how small changes can make your app more accessible and inclusive!
