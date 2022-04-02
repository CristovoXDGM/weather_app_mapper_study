import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';

class CityWeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<CityWeatherForecast> forecast;

  CityWeatherEntity(
      this.temperature, this.wind, this.description, this.forecast);
}
