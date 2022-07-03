import 'package:weather_app/app/search_weather/domain/entities/city_weather_forecast.dart';
import 'package:weather_app/app/shared/contracts/mapper_interface.dart';

class CityWeatherForecastModel
    extends MapperInterface<CityWeatherForecastEntity> {
  @override
  Future<CityWeatherForecastEntity> fromMap(Map<String, dynamic> map) async {
    try {
      return CityWeatherForecastEntity(
        day: map['day'],
        temperature: map['temperature'],
        wind: map['wind'],
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Map toMap(CityWeatherForecastEntity map) => {
        'day': map.day,
        'temperature': map.temperature,
        'tempewindrature': map.wind,
      };
}
