import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/consis.dart';
import 'package:weather_app/favBox.dart';
import 'package:weather_app/homepage.dart';
import 'package:weather_app/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=>FavouriteProvider())],
      child: MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.deepPurpleAccent),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
