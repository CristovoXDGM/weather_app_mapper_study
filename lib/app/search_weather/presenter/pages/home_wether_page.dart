import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: searchInputController,
            decoration: const InputDecoration(label: Text('City name')),
          ),
          ElevatedButton(
            onPressed: () {
              homeWeatherStore.getCityWeather(searchInputController.text);
            },
            child: const Text('Search  '),
          ),
          ScopedBuilder<HomeWeatherStore, SearchWeatherException,
              HomeWeatherState>(
            store: homeWeatherStore,
            onError: (context, error) => const Text('error'),
            onLoading: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            onState: (context, state) => Text(
                ' current ${state.cityWeatherEntity.description} ${state.cityWeatherEntity.wind} ${state.cityWeatherEntity.temperature}'),
          )
        ]),
      ),
    );
  }
}