import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/domain/repositories/search_weather_repository.dart';
import 'package:weather_app/app/search_weather/domain/usecase/search_weather_usecase.dart';

class SearchWeatherRepositoryMock extends Mock
    implements ISearchWeatherRepository {}

void main() {
  late ISearchWeatherUseCase useCase;
  late ISearchWeatherRepository repository;

  setUp(() {
    repository = SearchWeatherRepositoryMock();
    useCase = SearchWeatherUseCase(repository);
  });

  var fakeResult = CityWeatherEntity(
      description: 'a', forecast: [], temperature: 'a', wind: '');

  group('Search Weather tests', () {
    test('Should return a  CityWeatherEntity', () async {
      when(() => repository.getCityWeather(any())).thenAnswer(
        (invocation) async => right(fakeResult),
      );

      final result = await useCase('maceio');

      expect(result.fold(id, id), isA<CityWeatherEntity>());
      expect(result.isRight(), true);
    });
    test('Shouldn\'t return a  CityWeatherEntity', () async {
      when(() => repository.getCityWeather(any())).thenAnswer(
        (invocation) async => left(EmptySearchException()),
      );

      final result = await useCase('maceio');

      expect(result.fold(id, id), isA<SearchWeatherException>());
      expect(result.isLeft(), true);
    });
  });
}
