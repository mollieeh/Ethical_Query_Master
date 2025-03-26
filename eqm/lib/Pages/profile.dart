import 'package:flutter/material.dart';
import 'home.dart';

class Profile extends StatefulWidget 
{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> 
{
  bool isChecked = false;

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
                  'Profile',
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
          Column
          (
            children: 
            [
              CheckboxListTile
              (
                title: const Text('Dark Mode'),
                value: isChecked, 
                onChanged: (bool? value)
                {
                  setState(() 
                  {
                    isChecked = value!;
                  });
                },
              ),
              Container
              (
                height: 20,
                width: 100,
                color: Colors.grey,
                child: Text
                (
                  'Username',
                ),
              )
            ],
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