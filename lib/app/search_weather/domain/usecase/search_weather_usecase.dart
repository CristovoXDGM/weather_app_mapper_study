import 'package:dartz/dartz.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/domain/repositories/search_weather_repository.dart';

abstract class ISearchWeatherUseCase {
  Future<Either<SearchWeatherException, List<CityWeatherEntity>>> call(
      String cityName);
}

class SearchWeatherUseCase implements ISearchWeatherUseCase {
  final SearchWeatherRepository repository;

  SearchWeatherUseCase(this.repository);

  @override
  Future<Either<SearchWeatherException, List<CityWeatherEntity>>> call(
      String cityName) async {
    if (cityName.isEmpty) {
      return left(EmptySearchException());
    }

    return repository.getCityWeather(cityName);
  }
}
