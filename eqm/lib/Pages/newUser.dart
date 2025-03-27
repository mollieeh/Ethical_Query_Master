import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/login.dart';
import 'home.dart';

class NewUser extends StatelessWidget 
{
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: appBar(context, showIcon: false),
      body: loginStuff(context),
    );
  }

  Center loginStuff(BuildContext context) 
  {
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
              labelText: 'Email', 
              constraints: BoxConstraints
              (
                maxWidth: 300,
                maxHeight: 300,
              ), 
              helper: Text
              (
                'Enter a valid email.',
                style: TextStyle
                (
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ),
          TextField
          (
            decoration: InputDecoration
            (
              labelText: 'Username', 
              constraints: BoxConstraints
              (
                maxWidth: 300,
                maxHeight: 300,
              ), 
              helper: Text
              (
                'Username should include:\n-Uppercase Letters\n-Lowercase Letters\n-Numbers',
                style: TextStyle
                (
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
              )
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
                maxHeight: 300,
              ),
              helper: Text
              (
                'Password should include:\n-Uppercase Letters\n-Lowercase Letters\n-Numbers\n-Special Characters (@,#,!)\n-Longer than 8 characters\n-Do not use personal info',
                style: TextStyle
                (
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
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
                  onPressed: () 
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute
                      (
                        builder: (context) => Login()
                      )
                    );
                  },
                  child: const Text
                  (
                    'Back',
                    style: TextStyle
                    (
                      
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
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