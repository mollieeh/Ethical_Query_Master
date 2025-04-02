import 'package:flutter/material.dart';
import 'home.dart';
import 'forgot.dart';
import 'newUser.dart';
<<<<<<< HEAD

class Login extends StatelessWidget 
{
  const Login({super.key});

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
              labelText: 'Username', 
              constraints: BoxConstraints
              (
                maxWidth: 300,
                maxHeight: 100,
              ),
              helper: TextButton
              (
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => Forgot()
                    )
                  );
                },  
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
                onPressed: () 
                {
                  Navigator.push
                  (
                    context, 
                    MaterialPageRoute
                    (
                      builder: (context) => Forgot()
                    )
                  );
                }, 
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
                  onPressed: () 
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute
                      (
                        builder: (context) => NewUser()
                      )
                    );
                  },
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
=======
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      final auth = FirebaseAuth.instance;

      final userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCredential.user;

      if (user != null && user.emailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        await auth.signOut();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Verify Email"),
            content: const Text("Please verify your email before logging in."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Login Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                width: 500,
                child: Image.asset('assets/images/account.png', height: 100),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: loginUser,
                    child: const Text("Log In"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewUser()),
                      );
                    },
                    child: const Text("New User"),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Forgot()),
                  );
                },
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> b313f72212986cb00ce15a107eddd7f95281bec5
