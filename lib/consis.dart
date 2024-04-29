import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

const OPENWEATHER_API_KEY = 'd9cdae5f581d1a6e2e20a835825fe52f';

class FavouriteProvider extends ChangeNotifier{
  List<Weather?> favourites = [];

  void addToFavourite(Weather? weather){
    favourites.add(weather);
    notifyListeners();
  }

  void removeFromFavourite(Weather? weather){
    favourites.removeWhere((element) => element?.areaName == weather?.areaName);
    notifyListeners();
  }

  bool isFavourite(Weather? weather){
    return favourites.any((element) => element?.areaName == weather?.areaName);
  }
}
