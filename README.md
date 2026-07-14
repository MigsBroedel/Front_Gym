# Gym — Mobile (Flutter)

Flutter mobile client for a workout-tracking app: authenticate, browse and run workouts, and track training analytics. Consumes the [API_GYM](https://github.com/MigsBroedel/API_GYM) backend (Go + Gin + MongoDB).

![Flutter](https://img.shields.io/badge/Flutter-mobile-02569B)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

> _Screenshot placeholder — insira 2–3 telas (login, treino, analytics)._

## About

This is the frontend half of a full-stack workout app I built end to end — the Go/MongoDB API and this Flutter client. It let me learn Flutter's widget model and state handling against a real backend I controlled.

The app is organized by feature area under `lib/`: **Auth** (login/signup), **Home**, **Treinos** (workouts), **Analysis** (training analytics), **User** (profile), plus **Config**, **Global** (shared state/widgets), and **back** (the API client layer that talks to API_GYM).

## Stack

- **Flutter** / **Dart**
- REST client against the **API_GYM** Go backend

## Running locally

```bash
git clone https://github.com/MigsBroedel/Front_Gym.git
cd Front_Gym
flutter pub get
flutter run
```

Requires the [API_GYM](https://github.com/MigsBroedel/API_GYM) backend running; set its base URL in the API client under `lib/back/`.

## Architecture

```
lib/
├── Auth/        → login / signup
├── Home/        → home screen
├── Treinos/     → workouts
├── Analysis/    → training analytics
├── User/        → profile
├── Config/      → settings
├── Global/      → shared state & widgets
└── back/        → API client (API_GYM)
```

## Known limitations & roadmap

- API base URL is configured in code; move to environment/build config.
- Roadmap: offline support, tests (widget + integration), and iOS build.

## License

MIT
