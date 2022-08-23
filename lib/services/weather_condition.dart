import 'package:clima_weather_app/services/networking.dart';
import 'package:clima_weather_app/services/get_location.dart';

//Open weather map API app ID
const kApiKey = '379ae85fce7b5c035c344d04a556b7c0';
const kUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel{

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url: '$kUrl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    DeviceLocation location = DeviceLocation();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
        '$kUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
