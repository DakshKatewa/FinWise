lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── app_constants.dart
│   │   └── asset_constants.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   └── network_info.dart
│   ├── themes/
│   │   ├── app_themes.dart
│   │   └── app_colors.dart
│   └── utils/
│       ├── validators.dart
│       └── helper_functions.dart
│
├── features/
│   └── feature_name/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── remote_datasource.dart
│       │   │   └── local_datasource.dart
│       │   ├── models/
│       │   │   └── model.dart
│       │   └── repositories/
│       │       └── repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── entity.dart
│       │   ├── repositories/
│       │   │   └── repository.dart
│       │   └── usecases/
│       │       └── usecase.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── bloc.dart
│           │   ├── event.dart
│           │   └── state.dart
│           ├── pages/
│           │   └── feature_page.dart
│           └── widgets/
│               └── feature_widgets.dart
│
├── config/
│   ├── routes/
│   │   ├── app_routes.dart
│   │   └── route_generator.dart
│   └── di/
│       └── injection_container.dart
│
└── main.dart
