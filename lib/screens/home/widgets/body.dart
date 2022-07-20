import 'package:flutter/material.dart';
import 'package:larix/screens/home/widgets/welcome_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomeCard(nbApp: 10, nbInter: 3, nbMeeting: 4, nbProjects: 2),
          ],
        ),
      ),
    );
  }
}