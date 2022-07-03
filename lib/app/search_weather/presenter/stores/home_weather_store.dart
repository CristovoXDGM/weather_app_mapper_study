import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/domain/usecase/search_weather_usecase.dart';
import 'package:weather_app/app/search_weather/presenter/stores/home_weather_state.dart';

class HomeWeatherStore
    extends StreamStore<SearchWeatherException, HomeWeatherState> {
  final SearchWeatherUseCase _searchWeatherUseCase;

  HomeWeatherStore(this._searchWeatherUseCase)
      : super(HomeWeatherState(CityWeatherEntity()));

  Future<void> getCityWeather(String cityName) async {
    setLoading(true);

    if (cityName.isEmpty) {
      setError(EmptySearchException());
      return;
    }

    final results = await _searchWeatherUseCase(cityName);

    results.fold(setError, (newCityWeather) {
      update(
        state.copyWith(cityWeatherEntity: newCityWeather),
      );
    });

    setLoading(false);
  }
}
