# Weather App

## Introduction

Welcome to our Global Tour Weather Tracker, a nifty tool made for tour lovers and tech enthusiasts alike! It's an open-source gem that not only keeps you in the loop with the latest weather for major tour cities but also dazzles with offline magic, keeping you informed even when the internet takes a hike. Crafted with love as a skill showcase, this app is all about mixing practicality with a bit of tech flair. Dive in, explore, and see how tech can make your adventures smoother.

## Features

- Current Weather Updates: Instant access to the latest weather conditions.
- 5-Day Forecast: Plan ahead with accurate forecasts for the next five days.
- Major Tour Cities: Tailored weather information for each city on the tour.
- User-Friendly Interface: Easy navigation and clear, concise weather reports.

![online](https://github.com/toshiossada/weather_test/assets/2637049/227b74c3-3f47-4dba-a44d-a5721e299882)

## Works offline

The app smartly switches to an offline mode when you're not connected, using saved data to show you the weather. It won't update in real-time without the internet, but you'll still have all the last seen info at your fingertips. Perfect for when you're off-grid or just trying to save on data. Cool, right? It's all about making sure you're covered, with a little tech magic to keep things smooth.

![offline](https://github.com/toshiossada/weather_test/assets/2637049/fda2dddc-7d9e-466a-a75c-83dfb5a0e514)

## Flutter Modular

For learners and Flutter enthusiasts, this application serves as a practical example of professional development using Flutter Modular. It's crafted to demonstrate best practices and innovative solutions in app development. While this introduction offers a glimpse into the application's architecture, detailed insights and technical discussions are provided in a separate document designed to enrich your understanding and skills in Flutter development. [CHECK OUT](weather_test/ARCHTECTURE.md)

![Estrutura de pastas Modular](https://user-images.githubusercontent.com/2637049/116998708-018ce100-acb5-11eb-8e28-26b4b6dcd7fe.png)

## SETUP

### Generate API KEY

This project use the [OpenWeather](https://openweathermap.org) API.
You must to create a [free account](https://home.openweathermap.org/users/sign_up) and get your [API key](https://home.openweathermap.org/api_keys).

### .env

![image](https://github.com/toshiossada/weather_test/assets/2637049/94697fa0-7c42-4df1-9754-05d8c328612d)

After Generate API KEY you will need to create a `.env` file in the `weather_test` folder basead on [.env-example](weather_test/.env-example)
Need to have following context

```json
{
  "API_KEY": "YOUR_API_KEY",
  "BASE_URL": "https://api.openweathermap.org/data/2.5/"
}
```

For a detailed overview of what the project entails, including features and functionalities, check out the [Specification](https://gist.github.com/cloudwalk-tests/4689b2c15fd7d9d8d8fa807772d54516).

## Contributing

Your contributions are welcome! Please refer to our contribution guidelines for how to propose changes, report issues, or submit new features.

## License

This project is licensed under the MIT - see the LICENSE file for details.
