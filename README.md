# WeatherApp_v2

WeatherApp_v2 is a Flutter-based application designed to provide weather updates for cities around the world. This project leverages the MVVM (Model-View-ViewModel) architecture and uses the Provider package for state management. It fetches weather data using the OpenWeatherMap API.

## Features

- **Real-time Weather Data**: Get current weather information for various cities.
- **Voice Search**: Use speech recognition to search for weather in different cities.
- **City Filtering**: Search and filter cities with real-time updates.
- **User-friendly Interface**: Clean and intuitive design to enhance user experience.

## Getting Started

To start using this project, ensure you have Flutter installed on your system. Follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/weatherapp_v2.git
   cd weatherapp_v2
2. **Instal Depedencies**:
   ```bash
   flutter pub get
3. **Run The App**:
   ```bash
   flutter pub get

# Project Structure

This project follows the MVVM architecture:

- **Model**: Contains the data structure for city and weather information.
- **View**: Contains the UI components of the app.
- **ViewModel**: Manages the state and business logic, communicating between the View and Model.

## Dependencies

- `flutter`: The core Flutter SDK.
- `provider`: For state management.
- `speech_to_text`: For implementing voice search functionality.
- `dio` : package that facilitates making HTTP requests to a server
## Usage

1. **Search for a City**: Use the search bar to type the name of the city you want to get weather information for.
2. **Voice Search**: Click the microphone icon to use voice search.
3. **View Weather Details**: Select a city from the list to view detailed weather information.

## API Integration

This app uses the OpenWeatherMap API to fetch real-time weather data. You need to get an API key from OpenWeatherMap and configure it in your project.

## Resources

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- For more detailed documentation on Flutter, visit the [official Flutter documentation](https://docs.flutter.dev/).

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License.

---

Happy coding! If you have any questions, feel free to reach out.
