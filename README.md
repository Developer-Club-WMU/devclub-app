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

Copy the example environment file and set your environment-specific variables:

```bash
cp .env.example .env
```

Open `.env` in your editor and fill in the required values (e.g., database URL, authentication secrets, etc.).

### 4. Run the test environment

```bash
flutter run
```
Then select 2 for Chrome
For Responsive UI: right click + inspect 

Once the server is running, open [http://localhost:3000](http://localhost:3000) in your browser to view the app.