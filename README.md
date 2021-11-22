# Description

Flutter sandbox project rendering beers from [Punk API](https://punkapi.com/documentation/v2) using
a **clean architecture** with **MVVM pattern** (with `ViewModel`).

Each feature directory contains following structure:

```
/feature
    /data
        /datasource
        /model
        /repository
    /domain # Should NEVER depend on `data` or `presentation`
        /model
        /repository
        /usecase
    /presentation
        /model
        /viewmodel
        /widget
```

# Dependencies

- [Retrofit](https://pub.dev/packages/retrofit)
- [get_it](https://pub.dev/packages/get_it)
- [mockito](https://pub.dev/packages/mockito)

On any change to Retrofit API or test mock, run following command:

```shell
flutter pub run build_runner build
```

# Run

To execute app tests, simply run following command:

```shell
flutter test
```