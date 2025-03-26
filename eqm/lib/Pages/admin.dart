import 'package:flutter/material.dart';
import 'home.dart';

class Admin extends StatelessWidget 
{
  const Admin({super.key});

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
                  'Admin',
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
            padding: EdgeInsets.all(10)
          ),
          Center
          (
            child: SizedBox
            (
              height: 100,
              width: 500,
              child: Image.asset('assets/images/account.png', height: 100,),
            ),
          ),
          Padding
          (
            padding: EdgeInsets.all(10)
          ),
          Center
          (
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Container
                (
                  width: 450,
                  height: 400,
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                  child: TextField
                  (
                    decoration: InputDecoration
                    (
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Find User', 
                      constraints: BoxConstraints
                      (
                        maxWidth: 200,
                        maxHeight: 100,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            )
          ),
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