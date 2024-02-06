# SETUP

## Generate API KEY

This project use the [OpenWeather](https://openweathermap.org) API.
You must to create a [free account](https://home.openweathermap.org/users/sign_up) and get your [API key](https://home.openweathermap.org/api_keys).

## .env

![image](https://github.com/toshiossada/weather_test/assets/2637049/94697fa0-7c42-4df1-9754-05d8c328612d)

After Generate API KEY you will need to create a `.env` file in the root of project basead on [.env-example](.env-example)
Need to have following context

```json
{
  "API_KEY": "YOUR_API_KEY",
  "BASE_URL": "https://api.openweathermap.org/data/2.5/"
}
```

## Run the project

To run the project execute:

```bash
flutter run --dart-define-from-file=.env
```

## Run Test

To execute All Unit and Widgets test, run:

```bash
flutter test --concurrency=1
```

## Run Integration Test

To execute All Unit and Widgets test, run:

```bash
flutter test integration_test --dart-define-from-file=.env
```

## ARCHTECTURE

To know more about archtecture of project [CHECK OUT](ARCHTECTURE.md)
