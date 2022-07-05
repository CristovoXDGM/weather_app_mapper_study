import 'package:flutter/foundation.dart';
import 'package:uno/uno.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/infra/datasource/search_weather_datasource.dart';
import 'package:weather_app/app/search_weather/infra/models/city_weather_model.dart';
import 'package:weather_app/app/shared/constants/api_urls.dart';

class SearchWeatherDataSourceImpl implements SearchWeatherDataSource {
  final Uno uno;

  SearchWeatherDataSourceImpl(this.uno);

  @override
  Future<CityWeatherEntity> getCityWeather(String cityName) async {
    String url = '${ApiUrls.baseUrl}${ApiUrls.searchUrl}$cityName';

    final response = await uno.get(url);

    if (response.status != 200) {
      throw EmptySearchException();
    } else {
      debugPrint('[Data] ${response.data}');

      final cityWeather =
          await CityWeatherEntityMapper().fromMap(response.data);

      return cityWeather;
    }
  }
}
