import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';
import 'package:weather_app/app/search_weather/infra/models/city_weather_forecast_model.dart';
import 'package:weather_app/app/shared/contracts/mapper_interface.dart';

class CityWeatherEntityMapper extends MapperInterface<CityWeatherEntity> {
  @override
  Future<CityWeatherEntity> fromMap(Map<String, dynamic> map) async {
    try {
      final List<CityWeatherForecastEntity> cityWeatherForecastList = [];

      for (var item in map['forecast']) {
        cityWeatherForecastList.add(
          await CityWeatherForecastMapper().fromMap(item),
        );
      }

      return CityWeatherEntity(
        temperature: map['temperature'],
        wind: map['wind'],
        description: map['description'],
        forecast: cityWeatherForecastList,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Map toMap(CityWeatherEntity map) => {
        'temperature': map.temperature,
        'wind': map.wind,
        'description': map.description,
        'forecast': map.forecast.map((e) => e)
      };
}
