# Glucose Reader
App that consumes blood glucose samples from the the url "https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json"
After fetching it the data is plotted in a chart when app is open.

## Table of Contents

- [Architecture](#architecture)
- [Libraries Used](#libraries-used)
- [Getting Started](#getting-started)
- [Dev comments](#dev-comments)

## Architecture:
This project is built using the **Clean Architecture** principles, which ensure that the application is scalable, maintainable, and decoupled. The main reason for choosing this architectural style is to separate concerns, making the system easier to manage and test.

### State Management

**BLoC (Business Logic Component)** was chosen for state management because of its ability to separate business logic from UI components effectively, which aligns really well with CLEAN principles, enhancing modularity and testability. This separation enhances testability and reusability across the application. BLoC fits well with Flutter's reactive style, and it helps maintain a single source of truth for the application state, ensuring the UI remains consistent with the current state.

## Libraries Used

### get_it

**get_it** is used for dependency injection (DI) to manage the instantiation and lifecycle of our services and BLoCs. It was chosen because it's lightweight, easy to use, and does not rely on reflection, which increases the performance and startup time of the application.

### json_serialization

**json_serialization** is utilized to seamlessly convert JSON data into and out of strongly-typed Dart objects. This library automates the encoding and decoding processes, reduces boilerplate, and ensures type safety, which is crucial for maintaining data integrity across network calls and data storage.

### build_runner

**build_runner** is a build system that generates necessary files for a Flutter project—especially those related to `json_serialization`. It watches for changes in the project's source files and automatically rebuilds the necessary components, which enhances the development workflow and reduces manual errors during the build process.


### Run project
This app was tested on android devices only. So please run this on an android device
```bash
flutter pub get
flutter run
```

### Generating data classes
In order to generate the data classes you need to run:
``` flutter packages pub run build_runner build --delete-conflicting-outputs ```

### Dev comments
Thinking about scalability,modularization, Ive created a feature packages where all app features can be done separate in different packages. Which also can prevent conflicts among developers.

Following CLEAN, each feature will have your data/domain/presentation packages

Considering the sort time to develop the challenge, Ive chosen to give more focus to shaping the structure, business,data layers and its tests, over UI.
If it was done properly and using TDD, tests for any class would be missing

Some Basic feats missing:
- Formatting the date and showing corectly on the plot, should be done on the usecase
- Filter: Id modify the fetch code,adding start and end dates 
``` Future<List<BloodGlucose>> call({
DateTime? startDate,
DateTime? endDate,
}) async {
``` 
Regarding the UI, the chartPage should be converted to Stateful (should be anyway if we were in rod ready app, handling with navigation and other params/callbacks).
Better naming pattern could have been used, sometimes I use bloodGlucose, and other just glucose

#### Improvement  
| Func/Feat                | Obs                                                              |
|--------------------------|------------------------------------------------------------------|
| Localization             | Content Cell                                                     |
| Uikit module             | Create basic reusable widgets                                    |
| Smaller widgets          | Break down larger widgets into smaller, more granular components |
| iOS/web UI compatibility |                                                                  |
| Improve UI               |                                                                  |
| Perfomance / caching     |                                                                  |


