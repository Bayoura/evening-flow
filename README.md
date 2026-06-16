> **UX design preview.** The following screens were designed as part of this project. The Flutter implementation is currently in progress.
<img width="6000" height="1200" alt="Evening Flow UX preview" src="https://github.com/user-attachments/assets/caa92dbe-0efe-4946-b955-0ef65ade5882" />

# Evening Flow

A Flutter application for building a structured evening routine system. The project focuses on learning and implementing scalable Flutter architecture using MVVM principles, Firebase integration, and modular state management.

The app is currently under active development. Core architectural foundations and data models are implemented, while feature completion is in progress.

## Tech Stack

- Flutter (Dart)
- Firebase (Firestore)
- Provider (State Management)
- MVVM-inspired architecture

## Architecture

The project is structured using an MVVM-inspired approach:

- **Views**: UI layer
- **ViewModels**: State handling and business logic
- **Repositories**: Data layer (Firestore integration)
- **Models**: Core domain entities

## Project Structure
```
lib/
  data/
    repositories/
  models/
  viewmodels/
  views/
  widgets/
  utils/
```

## Current Status

The application is currently in early development.

### Implemented:

- Core data structures (Routine, Step, Mood models)
- Initial UI layout including:
  - Home screen (daily routine overview)
  - Routines overview screen
  - Mood tracking view with calendar and list representation
- State management setup using Provider and ChangeNotifier
- Firestore communication layer (CRUD operations implemented, UI integration in progress)
- Basic navigation structure
- Initial screens for routine creation and editing (work in progress)

### In progress / planned:

- Routine creation and editing flow
- Step management system (add, edit, reorder steps)
- Routine execution flow, including:
  - Step-by-step progression with timer
  - Completion tracking
  - Post-routine mood entry with optional notes
- Mood tracking improvements
- Template system improvements

## Design & UX

The UI and UX design for this application was created independently as part of the project. The focus was on building a calm, minimal, and user-centered experience for evening routines, with an emphasis on simplicity and usability.

-> [Case Study](https://kristin-seidelmann.notion.site/Evening-Flow-UX-Case-Study-2e2d02df7d808006b0d7f743e10c04c1)
