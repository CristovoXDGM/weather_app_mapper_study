import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/app/search_weather/domain/repositories/search_weather_repository.dart';
import 'package:weather_app/app/search_weather/infra/datasource/search_weather_datasource.dart';
import 'package:weather_app/app/search_weather/infra/models/city_weather_model.dart';

class SearchWeatherRepositoryImpl implements SearchWeatherRepository {
  final SearchWeatherDataSource dataSource;

  SearchWeatherRepositoryImpl(this.dataSource);

  @override
  Future<Either<SearchWeatherException, List<CityWeatherEntity>>>
      getCityWeather(String cityName) async {
    try {
      final List<CityWeatherModel> result =
          await dataSource.getCityWeather(cityName);

      return right(result);
    } on SearchWeatherException catch (e) {
      return left(e);
    }
  }
}
