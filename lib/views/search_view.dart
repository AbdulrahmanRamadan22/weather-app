import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);

            getWeatherCubit.getWeather(cityName: value);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            border: OutlineInputBorder(),
            hintText: "Enter City Name",
            labelText: "Search",
            suffixIcon: Icon(Icons.search),
          ),
        ),
      )),
    );
  }
}
