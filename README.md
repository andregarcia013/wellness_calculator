# Kalshi - Wellness Calculator

## Overview

This application calculates the customer wellness based on the annual income and monthly expanses

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [Packages Used](#packages-used)
- [Directory Structure](#directory-structure)
- [State Management](#state-management)
- [Routing](#routing)
- [Dependency Injection](#dependency-injection)

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/andregarcia013/wellness_calculator
    ```
2. Navigate to the project directory:
    ```sh
    cd wellness_calculator
    ```
3. Install dependencies:
    ```sh
    flutter pub get
    ```

### Running the App

To run the app on an emulator or physical device, use:
```sh
flutter run
```


### Architecture
The application follows a layered architecture with a clear separation of concerns to ensure scalability and maintainability.

UI Layer: Manages the UI and user interactions.
Core Layer: Handles all core functions and utils, as Routing, Sizer, etc...
Services Layer: Responsible for data retrieval, manipulation, and storage.


### Packages Used
Bloc: For state management.
GetIt: For dependency injection.
GoRouter: For routing.
Google Fonts: For typography.
Intl: For internationalization and formatting.

### Directory Architecture
````lib/
|-- services/
    -- wellness_calculator
       -- domain
       -- data 
|-- ui/
    -- features
|-- core/
    -- extensions
    -- utils
main.dart
````


### State management
State management is handled using the Bloc package. Blocs are used to separate the business logic from the UI, making the application more modular and testable.

Example 
```dart
class FinancialHealthBloc
    extends Bloc<FinancialHealthEvent, FinancialHealthState> {
  final GetFinancialHealthUseCase _getFinancialHealthUseCase;
  FinancialHealthBloc(this._getFinancialHealthUseCase)
      : super(FinancialHealthState()) {
    on<GetFinancialResult>(onGetFinancialResult);
  }

  void onGetFinancialResult(
      GetFinancialResult event, Emitter<FinancialHealthState> emit) {
    if (state is! FinancialHealthLoading) {
      emit(FinancialHealthLoading());
      final financialResult = _getFinancialHealthUseCase.handle(
          event.annualIncome, event.monthlyCosts);
      emit(FinancialHealthSuccess(financialHealth: financialResult));
    }
  }
}
 ```

### Routing

The routing is managed by GoRouter package, on  ``` lib/core/router.dart ```

You can add new routes and declare those routes on the file above and manage to push with the context 

```dart 
 context.go('/home');
 ```


 ### Dependecy Injection

The DI is managed by GetIt package, on ``` lib/core/di.dart```


Example registering a dependency 

```dart 
 getIt
      .registerFactory<FinancialHealthBloc>(() => FinancialHealthBloc(getIt()));
```


Injecting this dependency in another object

```dart 
 Object(getIt<FinancialHealthBloc>());
```