## Pocket-Tasks
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

## Prerequisites
- Flutter 3.24.3
- Dart ^3.5.3

## watch video demo here:
https://github.com/user-attachments/assets/cd1287cc-e38c-4caf-be2e-50a27df161b9

## Install & Run
- git clone https://github.com/tonyogodson/pocket_tasks.git
- cd pocket_tasks
- flutter pub get
- flutter pub run build_runner build
- flutter run

## Getting Started
- Tap the floating action button "+" to add a new task.
- Type a title for the task and add the task content.
- You can choose to add a future due date.
- Tap "Save Task" when done.
- To Edit a task, longpress the task to edit it.
- To view a task full details, tap on the task.
- To delete a task, select the task and tap the delete button at the top right corner of the screen.
- To sort tasks, tap the menu button at the top right corner of the home screen and choose sort type.
- Toggle between All, Active and Completed tasks from the home screen

## Also Check Widget tests files under "test"
