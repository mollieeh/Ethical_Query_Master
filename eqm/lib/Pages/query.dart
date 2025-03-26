import 'package:flutter/material.dart';
import 'home.dart';

class Query extends StatelessWidget 
{
  const Query({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: appBar(context),
      body: Column
      (
        children:
        [
          Center
          (
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
                  'Query',
                  style: TextStyle
                  (
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                )
              )
            ),
          ),
          Padding
          (
            padding: EdgeInsets.all(10),
          ),
          Center
          (
            child: TextField
            (
              textAlignVertical: TextAlignVertical(y: -1),
              autocorrect: true,
              maxLength: 500,
              decoration: InputDecoration
              (
                labelText: 'Ethical Question',
                constraints: BoxConstraints
                (
                  maxWidth: 450,
                  maxHeight: 300,
                ),
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              minLines: null,
              expands: true,
            )
          ),
          Padding
          (
            padding: EdgeInsets.all(10),
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              Container
              (
                width: 100,
                decoration: BoxDecoration
                (
                  color: Colors.green
                ),
                child: TextButton
                (
                  style: TextButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text
                  (
                    'For',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container
              (
                width: 100,
                decoration: BoxDecoration
                (
                  color: Colors.green
                ),
                child: TextButton
                (
                  style: TextButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text
                  (
                    'Neutral',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container
              (
                width: 100,
                decoration: BoxDecoration
                (
                  color: Colors.green
                ),
                child: TextButton
                (
                  style: TextButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text
                  (
                    'Against',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )
        ]
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