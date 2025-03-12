import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: appBar(),
      body: Center
      (
        child: TextButton         
        (
          style: TextButton.styleFrom
          (
            textStyle: const TextStyle
            (
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: null,
          child: const Text('Query'),
        ),
      ),
    );
  }
}

AppBar appBar()
{
  return AppBar
  (
    title: Text
    (
      'Ethical Query Master',
      style: TextStyle
      (
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ),
    backgroundColor: Colors.green,
    centerTitle: true,
    shape: Border
    (
      bottom: BorderSide
      (
        color: Colors.black,
        width: 4.0
      ),
      top: BorderSide
      (
        color: Colors.black,
        width: 4.0
        
      ),
      right: BorderSide
      (
        color: Colors.black,
        width: 4.0
      ),
      left: BorderSide
      (
        color: Colors.black,
        width: 4.0
      )
      
    ),
    leading: IconButton
    (
      icon: const Icon(Icons.home),
      tooltip: 'Home Menu',
      onPressed: () {},
    ),
  );
}