# App Introduction

This is the Developer Club App that will help new members navigate within the club, programmed by the App Department S25-F25.

Techstack: [Flutter](https://flutter.dev/) and [PostgreSQL](https://www.postgresql.org/)

Documentations: [Flutter Get Started](https://docs.flutter.dev/get-started/install), [Postgres Flutter Package](https://pub.dev/packages/postgres)

# Features:
- Home Page: Countdown towards next event, notification for next event, links to RSVP
- Events: Calender of all events, allow user to connect to Google Calendar and Team's Calender
- Developer Challenge: TBD
- Project Hub: Showcase all projects that is made from Developer Club
- Resources: Forms to request things like 1:1 Peer Mentor Sessions with Lead Devs, Reserving Remote Mac Minis/WindowsVM, Requesting funding for your passion project (for example: Apple Developer Program)

## Getting Started

Follow these steps to download, install dependencies, and run the project locally. 

### 0. "I've not set up flutter on my device before"
Go through: [Flutter Get Started](https://docs.flutter.dev/get-started/install), and then follow the instructions below after opening a new VSCode session

### 1. Clone the Repository

```bash
git clone https://github.com/Developer-Club-WMU/devclub-app.git
cd devclub-app
```

### 2. Install Dependencies

Again, make sure you have flutter installed, then

```bash
flutter pub get
```

### 3. Set Up Environment Variables

[Follow this guide](https://medium.com/@eng.abdalrhman33/use-environment-variables-for-flutter-apps-fd9d02289076)

### 4. Run the test environment

```bash
flutter run
```
Then select 2 for Chrome, for responsive UI testing do: right click + inspect


## Branching Strategies

1. main - client facing, only pull request (PR) here when finish testing and is sure it's a safe release
2. development - this is the final product that the developers play around with until sure it can be PR to main, every time a feature is finish implemented, PR here and request a pull from everyone.
3. feature - checkout a new branch from development formatted "feature/feature_name", then code away without fear. If multiple people is working on the same feature one for back end one for front end, make another feature layer from this one, make sure to commit frequently and alert each other to pull
4. archive - after finish a feature and got the PR to development approved, change the branch name to "archive/feature/feature_name". 
