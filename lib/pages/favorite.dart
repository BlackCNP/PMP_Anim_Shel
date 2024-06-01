import 'package:flutter/material.dart';
import 'package:pets/models/BottomNavBar.dart';
import 'package:pets/models/cats_model.dart';
import 'package:pets/pages/const.dart';
import 'home.dart';
import 'detail.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteAnimals = animals.where((animal) => animal.fav).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Улюблені тварини', style: poppins.copyWith(color: white)),
        backgroundColor: blue,
      ),
      body: favoriteAnimals.isEmpty
          ? Center(
        child: Text(
          'У вас немає улюблених тваринок.',
          style: poppins.copyWith(fontSize: 18, color: black),
        ),
      )
          : ListView.builder(
        itemCount: favoriteAnimals.length,
        itemBuilder: (context, index) {
          final animal = favoriteAnimals[index];
          return AnimalItem(
            animal: animal,
            onFavTapped: (updatedAnimal) {

              (context as Element).reassemble();
            },

            reducedHeight: true,
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
