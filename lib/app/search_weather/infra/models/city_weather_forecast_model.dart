import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';

class CityWeatherForecastModel extends CityWeatherForecast {
  CityWeatherForecastModel(
    String day,
    String temperature,
    String wind,
  ) : super(
          day,
          temperature,
          wind,
        );

  //Todo; Create a mapper folder and json serialization
}
