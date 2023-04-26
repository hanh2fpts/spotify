import 'package:flutter/material.dart';
import 'package:spotify/custom_page_route.dart';
import 'package:spotify/screens/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          SizedBox(
              height: double.infinity,
              child: Image.asset('assets/images/splash_screen.png', fit: BoxFit.contain)),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 1 / 3 - 70,
              left: 30,
              right: 30,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
                    ),
                    onPressed: () => Navigator.push(
                        context, CustomPageRoute(exitPage: this, enterPage: const HomePage())),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'RobotoBold'),
                    )),
              ))
        ]));
  }
}
