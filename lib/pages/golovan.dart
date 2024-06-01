import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'const.dart';
import '../models/golovna_models.dart';
import 'home.dart';
import 'download.dart';


class Golovna extends StatefulWidget {
  const Golovna({Key? key}) : super(key: key);

  @override
  State<Golovna> createState() => _GolovnaState();
}

class _GolovnaState extends State<Golovna> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late PageController _pageController;
  ValueNotifier<bool> isAnimationPlayed = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward().then((value) {
      isAnimationPlayed.value = true;
    });

    _pageController = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    isAnimationPlayed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height * 0.75,
            color: white,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardData.length,
                itemBuilder: (context, index) => OnBoardContent(
                  onBoard: onBoardData[index],
                  animation: _animation,
                  isAnimationPlayed: isAnimationPlayed,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (currentPage == onBoardData.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DownloadPage()),
                );
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          color: blue,
                          spreadRadius: 0,
                          blurRadius: 5)
                    ]),
                child: Center(
                  child: Text(
                    currentPage == onBoardData.length - 1 ? 'Почнімо' : 'Далі',
                    style: poppins.copyWith(color: white, fontSize: 16),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardData.length, (index) => indicator(index: index))
            ],
          )
        ],
      ),
    );
  }

  AnimatedContainer indicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      width: currentPage == index ? 20 : 6,
      height: 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: currentPage == index ? orange : black.withOpacity(0.6)),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final OnBoards onBoard;
  final Animation<double> animation;
  final ValueNotifier<bool> isAnimationPlayed;
  const OnBoardContent({Key? key, required this.onBoard, required this.animation, required this.isAnimationPlayed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width - 40,
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Image.asset(
              onBoard.image,
              height: 350,
            ),
          ),
          const SizedBox(height: 30),
          ValueListenableBuilder<bool>(
            valueListenable: isAnimationPlayed,
            builder: (context, isPlayed, child) {
              return isPlayed
                  ? Text(
                'Знайдіть Свою\nТваринку тут',
                style: poppins.copyWith(
                  height: 1.2,
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              )
                  : AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Знайдіть Свою\nТваринку',
                    textStyle: poppins.copyWith(
                      height: 1.2,
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            onBoard.text,
            textAlign: TextAlign.center,
            style: poppins.copyWith(color: black.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}
