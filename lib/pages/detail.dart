import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:pets/pages/const.dart';
import 'package:pets/models/cats_model.dart';

class DetailPage extends StatefulWidget {
  final Animal animal;

  const DetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.animal.color.withOpacity(0.5),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Hero(
                      tag: widget.animal.name,
                      child: Image.asset(
                        widget.animal.image,
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.animal.name,
                                    style: poppins.copyWith(
                                      fontSize: 24,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    color: widget.animal.fav
                                        ? red
                                        : black.withOpacity(0.6),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Icon(
                                widget.animal.fav
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: widget.animal.fav
                                    ? red
                                    : black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetailItem(
                              color: green,
                              detail: widget.animal.sex,
                              detail_: 'Стать',
                            ),
                            DetailItem(
                              color: orange,
                              detail: '${widget.animal.age} Років',
                              detail_: 'Вік',
                            ),
                            DetailItem(
                              color: blue,
                              detail: "${widget.animal.weight} Кг",
                              detail_: 'Вага',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: red,
                                image: DecorationImage(
                                  image: AssetImage(widget.animal.avki.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.animal.avki.name,
                                    style: poppins.copyWith(
                                      fontSize: 20,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Власник ${widget.animal.name} ",
                                    style: poppins.copyWith(
                                      fontSize: 14,
                                      color: black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tooltip(
                              message: (widget.animal.messenger),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: blue.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.chat_outlined,
                                  color: blue,
                                  size: 35,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Tooltip(
                              message: (widget.animal.phone),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: red.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.phone_outlined,
                                  color: red,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        ReadMoreText(
                          widget.animal.description,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'Більше',
                          colorClickableText: orange,
                          trimLength: 100,
                          trimMode: TrimMode.Length,
                          style: poppins.copyWith(
                            color: black.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 3),
                                color: blue,
                                spreadRadius: 0,
                                blurRadius: 10,
                              ),
                            ],
                            color: blue,
                          ),
                          child: Center(
                            child: Text(
                              'Забери мене',
                              style: poppins.copyWith(
                                fontSize: 14,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final Color color;
  final String detail, detail_;

  const DetailItem({
    Key? key,
    required this.color,
    required this.detail,
    required this.detail_,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  detail,
                  style: poppins.copyWith(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  detail_,
                  style: poppins.copyWith(
                    fontSize: 14,
                    color: black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
