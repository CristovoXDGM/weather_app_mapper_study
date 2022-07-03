import 'package:dartz/dartz.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/domain/repositories/search_weather_repository.dart';
import 'package:weather_app/app/search_weather/infra/datasource/search_weather_datasource.dart';

class SearchWeatherRepositoryImpl implements ISearchWeatherRepository {
  final SearchWeatherDataSource dataSource;

  SearchWeatherRepositoryImpl(this.dataSource);

  @override
  Future<Either<SearchWeatherException, CityWeatherEntity>> getCityWeather(
      String cityName) async {
    try {
      final CityWeatherEntity result =
          await dataSource.getCityWeather(cityName);

      return right(result);
    } on SearchWeatherException catch (e) {
      return left(e);
    }
  }
}
