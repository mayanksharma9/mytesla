# Application Blueprint

## Overview

This document outlines the architecture and implementation plan for a Flutter application that allows users to connect to their Tesla account and view their vehicle information. The application uses Firebase for authentication and Flutter for the frontend.

## Existing Features (as of initial setup)

*   **Firebase Authentication**: The app is set up with Firebase Authentication, allowing users to log in.
*   **Basic Routing**: The app uses `go_router` for navigation between screens.
*   **State Management**: `flutter_riverpod` is used for state management.
*   **Screens**:
    *   `LoginScreen`: A screen for user authentication.
    *   `HomeScreen`: The main screen after a user logs in.
    *   `VehicleListScreen`: A screen to display a list of vehicles.

## New Feature: Tesla Account Integration

This feature will allow authenticated users to connect their Tesla account to the app and view details about their vehicles.

### Plan:

1.  **Update Theme:**
    *   Modify `lib/core/theme.dart` to match the new dark theme inspired by the Tesla design.
    *   Update `ThemeData` with new colors, input decorations, and button styles.

2.  **Update Login and Signup Screens:**
    *   Redesign `lib/screens/login_screen.dart` to match the provided UI.
    *   Create a new `lib/screens/signup_screen.dart` to match the provided UI.
    *   Add the Tesla logo to both screens.

3.  **Secure Authentication:**
    *   Create a Firebase Function in `functions/src/auth.ts` to handle user registration securely.
    *   The Flutter app will call this function to create new users, providing a secure layer between the frontend and Firebase Authentication.

4.  **Update Routing:**
    *   Add a new route for the signup screen in `lib/router/app_router.dart`.
    *   Ensure seamless navigation between the login and signup screens.
