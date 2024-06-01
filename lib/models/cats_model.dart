import 'package:flutter/material.dart';
import '../pages/const.dart';
import 'avatarki_model.dart';

class Animal {
  final Color color;
  final String name,  sex, image, description, type, phone,messenger;
  final double age, weight;
  bool fav;
  final Avki avki;
  final bool isback;

  Animal({
    required this.fav,
    required this.type,
    required this.image,
    required this.color,
    required this.description,
    required this.name,

    required this.sex,
    required this.age,
    required this.weight,
    required this.avki,
    required this.phone,
    required this.messenger,
    this.isback = false,
  });
}

List<Animal> animals = [
  Animal(
      fav: true,
      type: 'кіт',
      color: orange,
      name: 'Мурчик',
      description: desc,

      phone: '+380 Київстар',
      messenger: 'Тільки Telegram',
      sex: 'хлопчик',
      age: 5,
      weight: 4,
      image: 'assets/cats/cat1.png',
      avki: avas[0]),

  Animal(
      fav: false,
      type: 'кіт',
      color: green,
      name: 'Зюзя',
      description: desc2,
      phone: '+380 Лайф',
      messenger: ' Тілки Viber',
      sex: 'дівчинка',
      age: 1,
      image: 'assets/cats/cat2.png',
      weight: 2,
      avki: avas[1]),
  /*Animal(
      fav: false,
      type: 'кіт',
      color: Colors.white,
      name: 'Мурко',
      image: 'assets/cats/cat3.png',
      description: desc3,
      phone: '+380 Лайф',
      messenger: ' Тілки Viber',
      sex: 'хлопчик',
      age: 1,
      weight: 3,
      avki: avas[2],
      isback: true),
*/

  Animal(
      fav: false,
      type: 'собака',
      color: blue,
      name: 'Мавпа',
      description: desc5,
      phone: '+380 Водафон',
      messenger: 'Telegram, Viber, What s up',
      sex: 'Дівчинка',
      age: 0.5,
      weight: 1.5,
      image: 'assets/cats/dog2.png',
      avki: avas[1]),
  Animal(
      fav: false,
      type: 'птах',
      color: black,
      name: 'Кєша',
      description: desc6,
      phone: '+380 15 75 2323',
      messenger: 'Через космос',
      sex: 'хлопчик',
      age: 1,
      weight: 0.5,
      image: 'assets/cats/bird1.png',
      avki: avas[2]),
];

String desc = 'Спокійний котик. З ним не буде проблем. Але мені здається що він краде їжу зі столу';
String desc2 = 'Дуже слухняна кішка,бо лінива. Постійно спить, встає тільки коли кличуть їсти. Якщо ви теж полюбляєте поспати то Зюзя вас чекає';

String desc5 = 'Дуже грайлива,навіть занадто.Дере шпалери,залазить на все що може і не може. Потребує такого ж активного власника =)';
String desc6 = 'Літає та скидує бомби. Щось візьме і буде літати до вас та кидатись речами. Вам з ним нудно ніколи не буде.';



