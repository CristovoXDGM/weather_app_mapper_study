import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';

class CityWeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<CityWeatherForecastEntity> forecast;

  CityWeatherEntity({
    this.temperature = '',
    this.wind = '',
    this.description = '',
    this.forecast = const [],
  });

  CityWeatherEntity copyWith({
    String? temperature,
    String? wind,
    String? description,
    List<CityWeatherForecastEntity>? forecast,
  }) {
    return CityWeatherEntity(
      temperature: temperature ?? this.temperature,
      wind: wind ?? this.wind,
      description: description ?? this.description,
      forecast: forecast ?? this.forecast,
    );
  }
}
