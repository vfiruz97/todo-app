# todo_app

A Simple Flutter project. It is a Todo application.

## Project Structure

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
