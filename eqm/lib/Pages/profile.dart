import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

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
          Center
          (
            child: Column
            (
              children: <Widget>
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
                Column
                (
                  children: 
                  [
                    Container
                    (
                      height: 20,
                      width: 450,
                      color: Colors.grey,
                      child: Text
                        (
                          'Username: ',
                          style: TextStyle
                          (
                            fontSize: 15
                          ),
                        ),
                    ),
                    Container
                    (
                      height: 40,
                      width: 450,
                      color: Colors.grey,
                      child: Container
                      (
                        height: 20,
                        width: 400,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration
                        (
                          borderRadius: BorderRadius.only
                          (                          
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)
                          ),
                          color: Colors.white
                        ),
                        
                      ),
                    ),
                  ],
                ),
                Column
                (
                  children: 
                  [
                    Container
                    (
                      height: 20,
                      width: 450,
                      color: Colors.grey,
                      child: Text
                        (
                          'Password: ',
                          style: TextStyle
                          (
                            fontSize: 15
                          ),
                        ),
                    ),
                    Container
                    (
                      height: 40,
                      width: 450,
                      color: Colors.grey,
                      child: Container
                      (
                        height: 20,
                        width: 400,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration
                        (
                          borderRadius: BorderRadius.only
                          (                          
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)
                          ),
                          color: Colors.white
                        ),
                        
                      ),
                    ),
                  ],
                ),
                Column
                (
                  children: 
                  [
                    Container
                    (
                      height: 20,
                      width: 450,
                      color: Colors.grey,
                      child: Text
                        (
                          'Email: ',
                          style: TextStyle
                          (
                            fontSize: 15
                          ),
                        ),
                    ),
                    Container
                    (
                      height: 40,
                      width: 450,
                      color: Colors.grey,
                      child: Container
                      (
                        height: 20,
                        width: 400,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration
                        (
                          borderRadius: BorderRadius.only
                          (                          
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)
                          ),
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        Container
                        (
                          margin: const EdgeInsets.only(left: 30, bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration
                          (
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(10),
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
                              showDialog
                              (
                                context: context, 
                                builder: (context) => AlertDialog
                                (
                                  title: Text
                                  (
                                    'Log Out'
                                  ),
                                  actions: 
                                  [
                                    Row
                                    (
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: 
                                      [
                                        TextButton
                                        (
                                          onPressed: ()
                                          {
                                            Navigator.of(context).pop();
                                          }, 
                                          child: Text
                                          (
                                            'Close'
                                          )
                                        ),
                                        TextButton
                                        (
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
                                          child: Text
                                          (
                                            'Log out'
                                          )
                                        )
                                      ],
                                    ),
                                  ],
                                  contentPadding: EdgeInsets.all(20),
                                  content: Text
                                  (
                                    'Are you sure you want to log out of this account?'
                                  ),
                                )
                              );
                            },
                            child: Text
                            (
                              'Log out',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container
                        (
                          margin: const EdgeInsets.only(right: 20, bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration
                          (
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(10),
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
                              showDialog
                              (
                                context: context, 
                                builder: (context) => AlertDialog
                                (
                                  title: Text
                                  (
                                    'Delete Account'
                                  ),
                                  actions: 
                                  [
                                    Row
                                    (
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: 
                                      [
                                        TextButton
                                        (
                                          onPressed: ()
                                          {
                                            Navigator.of(context).pop();
                                          }, 
                                          child: Text
                                          (
                                            'Close'
                                          )
                                        ),
                                        TextButton
                                        (
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
                                          child: Text
                                          (
                                            'Delete'
                                          )
                                        )
                                      ],
                                    ),
                                  ],
                                  contentPadding: EdgeInsets.all(20),
                                  content: Text
                                  (
                                    'Are you sure you want to delete this account?'
                                  ),
                                )
                              );
                            },
                            child: Text
                            (
                              'Delete Account',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> 
{
  @override
  Path getClip(Size size) 
  {
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