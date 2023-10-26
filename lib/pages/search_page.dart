import 'package:flutter/material.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
  }) : super(key: key);
  String? cityName = '';

  @override
  Widget build(BuildContext context) {
    WeatherCubit weatherCubit = WeatherCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              weatherCubit.getWeather(cityName: cityName!);
              weatherCubit.cityName = cityName;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
