import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';
import 'package:weather_app/app/shared/contracts/mapper_interface.dart';

class CityWeatherEntityMapper extends MapperInterface<CityWeatherEntity> {
  @override
  Future<CityWeatherEntity> fromMap(Map<String, dynamic> map) async {
    try {
      return CityWeatherEntity(
          temperature: map['temperature'],
          wind: map['wind'],
          description: map['description'],
          forecast: map['forecast'] != null
              ? List<CityWeatherForecastEntity>.from(map['forecast'])
                  .map((e) => e)
                  .toList()
              : <CityWeatherForecastEntity>[]);
    } catch (e) {
      throw Exception();
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
