import 'package:flutter/material.dart';
<<<<<<< HEAD
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
      
=======
import 'package:firebase_auth/firebase_auth.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Password reset email sent!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your email to reset your password:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetPassword,
                child: const Text('Send Reset Email'),
              ),
            ],
          ),
        ),
      ),
>>>>>>> b313f72212986cb00ce15a107eddd7f95281bec5
    );
  }
}