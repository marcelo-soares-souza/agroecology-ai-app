# Agroecology Map AI — Mobile

Flutter 3.44.1 app for Android and iPhone.

## Setup

```bash
flutter pub get
```

## Run

```bash
flutter run --dart-define=API_BASE_URL=http://localhost:8000
```

For Android emulator:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```

## Quality

```bash
dart format .
flutter analyze
```

## Architecture

Clean Architecture by feature (`domain` → `data` → `presentation`), using:

- `flutter_riverpod` — state management
- `go_router` — declarative navigation
- `dio` — HTTP client with interceptors
- `flutter_secure_storage` — token storage
- `shared_preferences` — chat history cache
- `flutter_localizations` — i18n (pt-BR, en, es, fr)
