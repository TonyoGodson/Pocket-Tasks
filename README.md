# Pocket-Tasks
Pocket Tasks is a simple Flutter task management app built with hive local storage, clean architecture, and provider state management.
## Features
- Add, edit, delete tasks
- Mark tasks as complete or incomplete
- Filter tasks (All, Active, Completed)
- Sort tasks by due date or creation date
- Local persistence using Hive
- State management using Provider
- Clean and responsive UI

## Architecture
- **Presentation Layer**: screens/, widgets/
- **Business Logic**: providers/ with ChangeNotifier
- **Data Layer**: Hive-backed model in data/models/

## Getting Started

### Prerequisites
- Flutter 3.24.3
- Dart ^3.5.3

### watch video demo here:
https://github.com/user-attachments/assets/cd1287cc-e38c-4caf-be2e-50a27df161b9

### Install & Run
git clone https://github.com/tonyogodson/pocket_tasks.git
cd pocket_tasks
flutter pub get
flutter pub run build_runner build
flutter run
