
import 'package:flutter/material.dart';
import 'package:pets/pages/home.dart';
import 'package:pets/pages/favorite.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  BottomNavBar({required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;

    Widget nextPage;
    if (index == 0) {
      nextPage = HomePage();
    } else if (index == 1) {
      nextPage = FavoritePage();
    } else {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.favorite_outline_rounded,
      //Icons.person_outline_rounded,
    ];

    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
              (index) => GestureDetector(
            onTap: () => _onItemTapped(context, index),
            child: Container(
              height: 60,
              width: 50,
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: Column(
                      children: [
                        Icon(
                          icons[index],
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.black.withOpacity(0.6),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        selectedIndex == index
                            ? Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue),
                        )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
