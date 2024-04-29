import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';

class FavBox extends StatelessWidget {
  final Weather? w;
  const FavBox({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,
      height: 144,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${w?.country}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    width: 200,
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${w?.areaName}",
                          style: const TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerRight,
                          image: NetworkImage(
                              'http://openweathermap.org/img/wn/${w!.weatherIcon}@4x.png'))))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${w?.weatherDescription}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "${w?.temperature?.celsius?.toStringAsFixed(0)} °C",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
