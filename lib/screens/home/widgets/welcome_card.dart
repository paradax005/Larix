import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    Key? key,
    required this.nbApp,
    required this.nbInter,
    required this.nbMeeting,
    required this.nbProjects,
  }) : super(key: key);

  final int nbApp;
  final int nbInter;
  final int nbMeeting;
  final int nbProjects;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xff8a92f0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back ETC Admin ! ",
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                textScaleFactor: 1.3,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  "Today you have $nbApp new applications, \n$nbInter interviews and $nbMeeting online meeting.\n$nbProjects projects should end this week.",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 0.9,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          Container(
            width: 80,
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcomeimg.png'),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
