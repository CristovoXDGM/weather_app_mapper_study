import 'package:dartz/dartz.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/infra/models/city_weather_model.dart';

abstract class SearchWeatherDataSource {
  Future<List<CityWeatherModel>> getCityWeather(String cityName);
}
