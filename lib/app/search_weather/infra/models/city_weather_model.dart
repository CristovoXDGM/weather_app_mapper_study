import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';

class CityWeatherModel extends CityWeatherEntity {
  CityWeatherModel(
    String temperature,
    String wind,
    String description,
    List<CityWeatherForecast> forecast,
  ) : super(
          temperature,
          wind,
          description,
          forecast,
        );
  //Todo; Create a mapper folder and json serialization
}
