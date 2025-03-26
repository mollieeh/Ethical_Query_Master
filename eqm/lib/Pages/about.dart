import 'package:flutter/material.dart';
import 'home.dart';

class About extends StatelessWidget 
{
  const About({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: appBar(context),
      body: SingleChildScrollView
      (
        child: Column
        (
          children:
          [
            Center(
              child: ClipPath
              (
                clipper: DownTrapezoidClipper(),
                child: Container
                (
                  width: 300,
                  height: 30,
                  color: const Color.fromARGB(255, 127, 255, 131),
                  alignment: Alignment.center,
                  child: const Text
                  (
                    'About Us',
                    style: TextStyle
                    (
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              ),
            ),
            // 👤 Profile 1
            profileCard(
              imagePath: 'assets/images/salvador.png',
              bio:
                  'Hi! I’m Ryan, the lead designer. I focused on the app’s interface and visuals.',
              role: 'Lead Designer',
            ),

            // 👤 Profile 2
            profileCard(
              imagePath: 'assets/images/ryan.png',
              bio:
                  'Hi! I’m Ryan, the backend developer. I worked on data logic and integrations.',
              role: 'Backend Dev',
            ),

            // 👤 Profile 3
            profileCard(
              imagePath: 'assets/images/mollie.png',
              bio:
                  'Hey! I’m Mollie, I handled the project’s management.',
              role: 'Project Manager',
            ),
            const SizedBox(height: 20),
          ]
        ),
      ),
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Border.all
    (
      color: Colors.black,
      width: 5,
    );
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget profileCard
(
  {
    required String imagePath,
    required String bio,
    required String role,
  }
)
{
  return Padding
  (
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child:Container
    (
      decoration: BoxDecoration
      (
        border: Border.all
        (
          color: Colors.black,
          width: 5,
        )
      ),
      child: Column
      (
        children: 
        [
          Container
          (
            decoration: BoxDecoration
            (
              border: Border.all
              (
                color: Colors.black,
                width: 5,
              )
            ),
            child: Image.asset(imagePath, height: 1000, fit: BoxFit.cover,),
          ),
          Padding
          (
            padding: const EdgeInsets.all(12.0),
            child: Text
            (
              bio,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Align
          (
            alignment: Alignment.bottomLeft,
            child: Container
            (
              margin: const EdgeInsets.only(left: 12, bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration
              (
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text
              (
                role,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          )
        ],
      )
    ),
  );
}