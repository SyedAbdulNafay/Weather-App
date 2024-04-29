import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/consis.dart';
import 'package:weather_app/favBox.dart';
import 'package:weather_app/onTapScreen.dart';
import 'package:weather_app/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Welcome to our Weather App",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()));
                      },
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[400]),
                        child: const Icon(Icons.search),
                      ))
                ],
              ),
              const Text(
                "Favourites",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              Consumer<FavouriteProvider>(
                builder: (context, favouriteProvider, child) => Expanded(
                    child: favouriteProvider.favourites.isEmpty
                        ? const Center(
                            child: Text(
                              "No favourites",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            itemCount: favouriteProvider.favourites.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OnTapScreen(
                                                    w: favouriteProvider
                                                        .favourites[index],
                                                  )));
                                    },
                                    child: FavBox(
                                        w: favouriteProvider
                                            .favourites[index])),
                              );
                            }))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
