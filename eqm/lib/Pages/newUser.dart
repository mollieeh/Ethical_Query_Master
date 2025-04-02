import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> registerUser() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      final uid = userCredential.user!.uid;

      // Store username in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': Timestamp.now(),
      });

      await userCredential.user!.sendEmailVerification();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Email Sent"),
          content: const Text(
              "A verification link has been sent to your email. Please verify before logging in."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              ),
              child: const Text("OK"),
            )
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Registration Error"),
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
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                child: const Text("Register"),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                ),
                child: const Text("Back to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> b313f72212986cb00ce15a107eddd7f95281bec5
