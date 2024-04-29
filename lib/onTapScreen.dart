import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/consis.dart';

class OnTapScreen extends StatefulWidget {
  final Weather? w;
  const OnTapScreen({super.key, this.w});

  @override
  State<OnTapScreen> createState() => _OnTapScreenState();
}

class _OnTapScreenState extends State<OnTapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(child: getUI(widget.w)),
    );
  }

  Widget getUI(Weather? weather) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://openweathermap.org/img/wn/${weather!.weatherIcon}@4x.png')))),
          Consumer<FavouriteProvider>(
            builder: (context, favouriteProvider, child) => IconButton(
                onPressed: () {
                  if (favouriteProvider.isFavourite(weather)) {
                    favouriteProvider.removeFromFavourite(weather);
                  } else {
                    favouriteProvider.addToFavourite(weather);
                  }
                },
                icon: Icon(
                    favouriteProvider.isFavourite(weather)
                        ? Icons.star
                        : Icons.star_border,
                    color: favouriteProvider.isFavourite(weather)
                        ? Colors.yellow
                        : Colors.grey)),
          ),
          Text(
            weather.areaName!,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            "${weather.temperature?.celsius?.toStringAsFixed(0)} °C",
            style: const TextStyle(
                fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          LayoutBuilder(
            builder: (context, constraints) { return Row(
              children: [
                Container(
                  width: constraints.maxWidth / 4,
                  height: 57,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border.symmetric(
                          vertical: BorderSide(color: Colors.white))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "TIME",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        DateFormat('h:mm a').format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 4,
                  height: 57,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border.symmetric(
                          vertical: BorderSide(color: Color(0xFFC4C4C4)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "MAX TEMP",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "${weather.tempMax?.celsius?.toStringAsFixed(0)} °C",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 4,
                  height: 57,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border.symmetric(
                          vertical: BorderSide(color: Color(0xFFC4C4C4)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "MIN",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "${weather.tempMin?.celsius?.toStringAsFixed(0)} °C",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 4,
                  height: 57,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border.symmetric(
                          vertical: BorderSide(color: Color(0xFFC4C4C4)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "WIND",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "${weather.windSpeed?.toStringAsFixed(0)} °C",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );}
          )
        ],
      ),
    );
  }
}
