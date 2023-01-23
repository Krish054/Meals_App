import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  void showTabScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => showTabScreen(context),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/mealsGrid.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black54,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.pink,
                    ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text(
                      'MEALS APP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: const Text(
                      'So what are you going to cook today?',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Solitreo',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.65),
              child: Text(
                'Tap anywhere to continue!',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
