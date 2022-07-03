import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';

abstract class SearchWeatherDataSource {
  Future<CityWeatherEntity> getCityWeather(String cityName);
}
