import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_app/app/search_weather/domain/entities/city_weather_entity.dart';
import 'package:weather_app/app/search_weather/domain/errors/search_weather_exceptions.dart';
import 'package:weather_app/app/search_weather/presenter/stores/home_weather_state.dart';
import 'package:weather_app/app/search_weather/presenter/stores/home_weather_store.dart';

class HomeWeatherPage extends StatefulWidget {
  const HomeWeatherPage({Key? key}) : super(key: key);

  @override
  State<HomeWeatherPage> createState() => _HomeWeatherPageState();
}

class _HomeWeatherPageState extends State<HomeWeatherPage> {
  final homeWeatherStore = Modular.get<HomeWeatherStore>();
  final searchInputController = TextEditingController();
  late CityWeatherEntity homeWeaterCitystate;
  late CityWeatherEntity currentHomeWeatherCity;

  Color verifyClodyDay(String description) {
    if (description.contains('cloud')) {
      return Colors.black45;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: searchInputController,
          onSubmitted: (value) =>
              homeWeatherStore.getCityWeather(searchInputController.text),
          decoration: InputDecoration(
              label: const Text('City name'),
              prefixIcon: GestureDetector(
                child: const Icon(Icons.search),
                onTap: () =>
                    homeWeatherStore.getCityWeather(searchInputController.text),
              )),
        ),
      ),
      body: SingleChildScrollView(
          child: ScopedBuilder<HomeWeatherStore, SearchWeatherException,
                  HomeWeatherState>(
              store: homeWeatherStore,
              onError: (context, error) => const Text('error'),
              onLoading: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              onState: (context, state) {
                homeWeaterCitystate = state.cityWeatherEntity;
                currentHomeWeatherCity = homeWeaterCitystate;
                return Container(
                  padding: const EdgeInsets.all(18),
                  color: verifyClodyDay(homeWeaterCitystate.description),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentHomeWeatherCity.temperature,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                      Text(
                        currentHomeWeatherCity.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        currentHomeWeatherCity.wind,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: currentHomeWeatherCity.forecast.length,
                          itemBuilder: ((context, index) {
                            return Text(
                              currentHomeWeatherCity
                                  .forecast[index].temperature,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
