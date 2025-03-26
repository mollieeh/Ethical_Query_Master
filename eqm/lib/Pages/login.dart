import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: appBar(context, showIcon: false),
      body: loginStuff(context),
    );
  }

  Center loginStuff(BuildContext context) {
    return Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
        [
          SizedBox
          (
            height: 100,
            width: 500,
            child: Image.asset('assets/images/account.png', height: 100,),
          ),
          TextField
          (
            decoration: InputDecoration
            (
              labelText: 'Username', 
              constraints: BoxConstraints
              (
                maxWidth: 300,
                maxHeight: 100,
              ),
              helper: TextButton
              (
                onPressed: () {}, 
                child: const Text
                (
                  'Forgot Username?',
                  style: TextStyle
                  (
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),
          TextField
          (
            decoration: InputDecoration
            (
              labelText: 'Password', 
              constraints: BoxConstraints
              (
                maxWidth: 300,
                maxHeight: 100,
              ),
              helper: TextButton
              (
                onPressed: () {}, 
                child: const Text
                (
                  'Forgot Password?',
                  style: TextStyle
                  (
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              Container
              (
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
                  child: const Text
                  (
                    'Log In',
                    style: TextStyle
                    (
                      
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              Container
              (
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
                    'New User',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )
        ]
      )
      
    );
  }
}