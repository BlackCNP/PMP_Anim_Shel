import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/pages/home.dart';

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/anima/cat.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              repeat: false,
              animate: true,
              onLoaded: (composition) {
                Future.delayed(composition.duration, () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Зачекайте, будь ласка. Триває завантаження...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
