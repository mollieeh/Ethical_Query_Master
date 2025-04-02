import 'package:flutter/material.dart';
import 'home.dart';
import 'forgot.dart';
import 'newUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // To bypass the login, comment out this future function.
  // Future<void> loginUser() async {
  //   try {
  //     final auth = FirebaseAuth.instance;

  //     final userCredential = await auth.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );

  //     final user = userCredential.user;

  //     if (user != null && user.emailVerified) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomePage()),
  //       );
  //     } else {
  //       await auth.signOut();
  //       showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //           title: const Text("Verify Email"),
  //           content: const Text("Please verify your email before logging in."),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: const Text("Login Error"),
  //         content: Text(e.toString()),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text("Close"),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), automaticallyImplyLeading: false,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
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
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 25,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },         // loginUser
                      child: const Text("Log In"),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NewUser()),
                        );
                      },
                      child: const Text("New User"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Forgot()),
                    );
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
