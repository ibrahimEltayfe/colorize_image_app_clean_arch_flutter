# colorize_image_app
An app to transform black and white images to colorized image.

<img src="https://github.com/user-attachments/assets/86493b27-3cab-4e4d-ba55-69529bd46eaf" width="300" >

```.
├── core
│   ├── data
│   │   ├── data_sources
│   │   ├── models
│   │   └── repositories
│   ├── di
│   │   └── common_di.dart
│   ├── domain
│   │   ├── entities
│   │   ├── repositories
│   │   └── use_cases
│   └── utils
│       ├── constants
│       │   ├── app_colors.dart
│       │   ├── app_dimensions.dart
│       │   ├── app_image_paths.dart
│       │   ├── app_styles.dart
│       │   └── end_points.dart
│       ├── error_handling
│       │   ├── failures.dart
│       │   └── failures_handler.dart
│       ├── extensions
│       │   └── mediaquery_size.dart
│       ├── injector
│       │   └── injector_config.dart
│       ├── router
│       │   └── app_routers_config.dart
│       ├── services
│       │   ├── dio_helper.dart
│       │   ├── media_picker.dart
│       │   └── network_checker.dart
│       └── ui
│           ├── app_button.dart
│           └── app_image.dart
├── features
│   └── home
│       ├── data
│       │   ├── data_sources
│       │   │   └── colorize_image_datasource.dart
│       │   ├── mappers
│       │   │   ├── colorize_image_mapper.dart
│       │   │   └── image_input_mapper.dart
│       │   ├── models
│       │   │   ├── inputs
│       │   │   │   └── colorize_image_api_input.dart
│       │   │   └── image_response_model.dart
│       │   └── repositories
│       │       └── colorize_image_repository_impl.dart
│       ├── di
│       │   └── home_injectors.dart
│       ├── domain
│       │   ├── entities
│       │   │   ├── inputs
│       │   │   │   └── colorize_image_input.dart
│       │   │   └── colorized_image_entity.dart
│       │   ├── repositories
│       │   │   └── colorize_image_repository.dart
│       │   └── use_cases
│       │       ├── get_colorized_image_usecase.dart
│       │       └── save_image_to_gallery.dart
│       └── presentation
│           ├── manager
│           │   ├── colorize_image_cubit.dart
│           │   └── colorize_image_state.dart
│           ├── pages
│           │   ├── home_page.dart
│           │   └── image_download_page.dart
│           └── widgets
│               ├── gradient_text.dart
│               └── image_picker_media_view.dart
└── main.dart```
