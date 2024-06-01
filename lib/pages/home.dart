
import 'package:flutter/material.dart';
import 'package:pets/models/BottomNavBar.dart';
import 'const.dart';
import 'package:pets/models/cats_model.dart';
import 'package:pets/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Всі', 'Коти', 'Собаки', 'Птахи', 'продам гараж'];

  List<Animal> filterAnimals(String category) {
    return animals.where((animal) => animal.type == category).toList();
  }

  List<Animal> get filteredAnimals {
    switch (category) {
      case 'Коти':
        return animals.where((animal) => animal.type == 'кіт').toList();
      case 'Собаки':
        return animals.where((animal) => animal.type == 'собака').toList();
      case 'Птахи':
        return animals.where((animal) => animal.type == 'птах').toList();
      default:
        return animals;
    }
  }

  String category = 'Animals';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.person_outline_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Кігтик, ',
                            style: poppins.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: black)),
                        TextSpan(
                            text: 'Притулок тварин',
                            style: poppins.copyWith(fontSize: 24, color: black)),
                      ])),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: blue.withOpacity(0.6),
                child: Stack(children: [
                  Positioned(
                      bottom: 0,
                      right: 20,
                      height: 135,
                      child: Image.asset('assets/cats/cat1.png')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Приєднуйся до нас\nЛюбителів тварин',
                          style: poppins.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: orange),
                          child: Text(
                            'Зателефонувати',
                            style: poppins.copyWith(color: white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Категорії',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(width: 10),
              ...List.generate(
                categories.length,
                    (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        category = categories[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: categories[index] == category ? blue : white,
                            boxShadow: [
                              categories[index] == category
                                  ? const BoxShadow(
                                  offset: Offset(0, 5),
                                  color: blue,
                                  spreadRadius: 0,
                                  blurRadius: 5)
                                  : const BoxShadow(color: white),
                            ]),
                        child: Text(
                          categories[index],
                          style: poppins.copyWith(
                              color: categories[index] == category
                                  ? white
                                  : black,
                              fontSize: 14),
                        )),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Забрати тваринку',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filteredAnimals.map((animal) {
                return Padding(
                  padding: animal == filteredAnimals.first
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: AnimalItem(
                    animal: animal,
                    onFavTapped: (updatedAnimal) {
                      setState(() {
                        final animalToUpdate = filteredAnimals.firstWhere(
                                (animal) => animal.name == updatedAnimal.name);
                        animalToUpdate.fav = !animalToUpdate.fav;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}

class AnimalItem extends StatelessWidget {
  final Animal animal;
  final Function(Animal) onFavTapped;
  final bool reducedHeight;

  const AnimalItem({
    Key? key,
    required this.animal,
    required this.onFavTapped,
    this.reducedHeight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(animal: animal),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: reducedHeight
              ? MediaQuery.of(context).size.height * 0.25
              : MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.5,
          color: animal.color.withOpacity(0.6),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 10,
                left: 10,
                child: Hero(
                  tag: animal.name,
                  child: Image.asset(
                    animal.image,
                    height: reducedHeight
                        ? MediaQuery.of(context).size.height * 0.24
                        : MediaQuery.of(context).size.height * 0.27,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animal.name,
                            style: poppins.copyWith(
                                fontSize: 26,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onFavTapped(animal);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: white),
                        child: Icon(
                          animal.fav
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: animal.fav ? red : black.withOpacity(0.6),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
