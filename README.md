# todo_app

A Simple Flutter project. It is a Todo application.

## Project Structure

```
presentation/
├── cubit/ # State management (Bloc pattern)
├── pages/ # UI screens
└── validators/ # Form validation

application/
└── services/ # Business logic orchestration

domain/
├── entities/ # Core business entities
├── repositories/ # Repository contracts
└── usecases/ # Domain use cases

infrastructure/
├── network/ # HTTP, connectivity, network configuration
├── repositories/ # Repository implementations
└── mappers/ # Data transformation
```

## Run on production

To run the app follow these steps:

```bash
# move .env.example to .env, make sure that it has correct environment variable values
cp .env.example .env

flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
