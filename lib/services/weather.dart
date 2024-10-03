import 'package:aura/services/location.dart';
import 'package:aura/services/networking.dart';

const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '33c4b3774f8325692494cb423b937da0';

class WeatherModel {
  Future<dynamic> getCurrentLocationWeather() async {
    await Future.delayed(const Duration(seconds: 3));
    await Location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherURL?lat=${Location.latitude}&lon=${Location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    await Future.delayed(const Duration(seconds: 1));
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherImage(int id) {
    if (id >= 802 && id <= 804) {
      return 'images/clouds.png';
    } else if (id == 500 || id == 501) {
      return 'images/lightRain.png';
    } else if (id >= 502 && id <= 531) {
      return 'images/heavyRain.png';
    } else if (id == 801) {
      return 'images/sunny.png';
    } else if (id >= 200 && id <= 232) {
      return 'images/thunderstorm.png';
    } else if (id >= 600 && id <= 622) {
      return 'images/snow.png';
    } else if (id >= 300 && id <= 321) {
      return 'images/lightRain.png';
    } else if (id == 800) {
      return 'images/clearSky.png';
    } else {
      return 'images/else.png';
    }
  }

  String getNiceImage(String id) {
    switch (id) {
      case "01d":
        return 'images/day.jpg';
      case '02d':
        return 'images/day.jpg';
      case '03d':
        return 'images/day.jpg';
      case '04d':
        return 'images/day.jpg';
      case '09d':
        return 'images/day.jpg';
      case '10d':
        return 'images/day.jpg';
      case '11d':
        return 'images/day.jpg';
      case '13d':
        return 'images/day.jpg';
      case '50d':
        return 'images/day.jpg';
      case "01n":
        return 'images/night.jpg';
      case '02n':
        return 'images/night.jpg';
      case '03n':
        return 'images/night.jpg';
      case '04n':
        return 'images/night.jpg';
      case '09n':
        return 'images/night.jpg';
      case '10n':
        return 'images/night.jpg';
      case '11n':
        return 'images/night.jpg';
      case '13n':
        return 'images/night.jpg';
      case '50n':
        return 'images/night.jpg';
      default:
        return 'images/else.jpg';
    }
  }

  String getWeatherIcon(String id) {
    switch (id) {
      case "01d":
        return 'images/01d.png';
      case '02d':
        return 'images/02d.png';
      case '03d':
        return 'images/03d.png';
      case '04d':
        return 'images/04d.png';
      case '09d':
        return 'images/09d.png';
      case '10d':
        return 'images/10d.png';
      case '11d':
        return 'images/11d.png';
      case '13d':
        return 'images/13d.png';
      case '50d':
        return 'images/50d.png';
      case "01n":
        return 'images/01n.png';
      case '02n':
        return 'images/02n.png';
      case '03n':
        return 'images/03d.png';
      case '04n':
        return 'images/04d.png';
      case '09n':
        return 'images/09d.png';
      case '10n':
        return 'images/10n.png';
      case '11n':
        return 'images/11d.png';
      case '13n':
        return 'images/13d.png';
      case '50n':
        return 'images/50d.png';
      default:
        return 'images/else.png';
    }
  }

  String getAdvice(String id) {
    switch (id) {
      case "01d":
        return 'It\'s a clear sky today! Perfect for outdoor activities.';
      case '02d':
        return 'Few clouds—carry sunglasses!';
      case '03d':
        return 'Scattered clouds—might see some sun.';
      case '04d':
        return 'Broken clouds—sunshine peeking through.';
      case '09d':
        return 'Shower rain expected—grab an umbrella.';
      case '10d':
        return 'Rainy day ahead—keep an umbrella handy.';
      case '11d':
        return 'Thunderstorm coming—stay safe indoors.';
      case '13d':
        return 'Snowy day—dress warmly and enjoy the snow.';
      case '50d':
        return 'Misty day—drive carefully and stay warm.';
      case "01n":
        return 'Clear night sky—ideal for stargazing.';
      case '02n':
        return 'A few clouds tonight—cool and calm.';
      case '03n':
        return 'Scattered clouds tonight—comfortable evening.';
      case '04n':
        return 'Cloudy night—cozy indoors.';
      case '09n':
        return 'Rain showers tonight—stay dry.';
      case '10n':
        return 'Rainy night—perfect for a warm drink.';
      case '11n':
        return 'Thunderstorm tonight—avoid outdoor activities.';
      case '13n':
        return 'Snowfall tonight—bundle up before heading out.';
      case '50n':
        return 'Misty night—visibility is low, be cautious.';
      default:
        return 'Unavailable information to suggest the today.';
    }
  }
}
