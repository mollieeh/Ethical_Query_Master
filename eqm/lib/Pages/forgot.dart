import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/login.dart';
import 'home.dart';

class Forgot extends StatelessWidget 
{
  const Forgot({super.key});

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
                maxHeight: 100,
              ),
              helper: Text
              (
                'Send email to recover account.',
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
                height: 30,
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
                    'Send Email',
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