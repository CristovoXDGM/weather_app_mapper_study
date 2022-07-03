import 'package:dartz/dartz.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';

abstract class ISearchWeatherRepository {
  Future<Either<SearchWeatherException, CityWeatherEntity>> getCityWeather(
      String cityName);
}
