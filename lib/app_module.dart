import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';
import 'package:weather_app/app/search_weather/domain/usecase/search_weather_usecase.dart';
import 'package:weather_app/app/search_weather/external/datasource/search_weather_datasource.dart';
import 'package:weather_app/app/search_weather/infra/repositories/search_weather_repository.dart';
import 'package:weather_app/app/search_weather/presenter/pages/home_wether_page.dart';
import 'package:weather_app/app/search_weather/presenter/stores/home_weather_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => Uno(),
        ),
        Bind.factory(
          (i) => SearchWeatherDataSourceImpl(i()),
        ),
        Bind.factory(
          (i) => SearchWeatherUseCase(i()),
        ),
        Bind.factory(
          (i) => SearchWeatherRepositoryImpl(i()),
        ),
        Bind.lazySingleton((i) => HomeWeatherStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomeWeatherPage(),
        )
      ];
}
