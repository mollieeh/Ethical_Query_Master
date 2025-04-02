import 'package:flutter/material.dart';
import 'home.dart';

class ResultsQuery extends StatelessWidget {
  final String responseText;
  const ResultsQuery({super.key, required this.responseText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: ClipPath(
                clipper: DownTrapezoidClipper(),
                child: Container(
                  width: 300,
                  height: 30,
                  color: const Color.fromARGB(255, 127, 255, 131),
                  alignment: Alignment.center,
                  child: const Text(
                    'Results',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    responseText,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              decoration: const BoxDecoration(color: Colors.green),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  // Implement save functionality later
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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

class DownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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