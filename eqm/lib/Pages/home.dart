import 'package:flutter/material.dart';
import 'query.dart';
import 'admin.dart';
import 'about.dart';
import 'profile.dart';
import 'history.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: appBar(context),
      body: centerButtons(context),
    );
  }

  Center centerButtons(BuildContext context) 
  {
    return Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>
        [
          Tooltip(
            message: 'Query lets you ask AI ethical questions where you choose what kind of response you prefer.',
            child: Container
            (
              width: 150,
              height: 50,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only
                (
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.black,
                border: Border.all
                (
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: TextButton         
              (
                style: TextButton.styleFrom
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  overlayColor: Colors.white,
                  textStyle: const TextStyle
                  (
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => Query()
                    )
                  );
                }, 
                child: const Text('Query'),
                
              ),
            ),
          ),
          Tooltip(
            message: 'History lets you see your question and response history.',
            child: Container
            (
              width: 150,
              height: 50,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only
                (
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.black,
                border: Border.all
                (
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: TextButton         
              (
                style: TextButton.styleFrom
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle
                  (
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => History()
                    )
                  );
                },
                child: const Text('History'),
              ),
            ),
          ),
          Tooltip(
            message: 'Learn about the creators of the app!',
            child: Container
            (
              width: 150,
              height: 50,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only
                (
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.black,
                border: Border.all
                (
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: TextButton         
              (
                style: TextButton.styleFrom
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle
                  (
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => About()
                    )
                  );
                },
                child: const Text('About Us'),
              )
            ),
          ),
          Tooltip(
            message: 'Admin lets administrators check user accounts.',
            child: Container
            (
              width: 150,
              height: 50,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only
                (
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.black,
                border: Border.all
                (
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: TextButton         
              (
                style: TextButton.styleFrom
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle
                  (
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => Admin()
                    )
                  );
                },
                child: const Text('Admin'),
              ),
            ),
          ),
          Tooltip(
            message: 'Profile lets you check your username, email, password, and system settings.',
            child: Container
            (
              width: 150,
              height: 50,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.only
                (
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.black,
                border: Border.all
                (
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: TextButton         
              (
                style: TextButton.styleFrom
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle
                  (
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => Profile()
                    )
                  );
                },
                child: const Text('Profile'),
              ),
            ),
          ),  
        ],
      )
    );
  }
}

AppBar appBar(BuildContext context)
{
  return AppBar
  (
    automaticallyImplyLeading: false,
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
      onPressed: () 
      {
        Navigator.push
        (
          context, 
          MaterialPageRoute
          (
            builder: (context) => HomePage()
          )
        );
      },
    ),
  );
}