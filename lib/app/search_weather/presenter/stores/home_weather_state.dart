import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';

class HomeWeatherState {
  final CityWeatherEntity cityWeatherEntity;

  HomeWeatherState(this.cityWeatherEntity);

  HomeWeatherState copyWith({
    CityWeatherEntity? cityWeatherEntity,
  }) {
    return HomeWeatherState(
      cityWeatherEntity ?? this.cityWeatherEntity,
    );
  }
}
