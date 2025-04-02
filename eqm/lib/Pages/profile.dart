import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = '';
  String email = '';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      username = doc['username'] ?? '';
      email = doc['email'] ?? '';
      _usernameController.text = username;
    });
  }

  Future<void> updateUsername() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'username': _usernameController.text.trim(),
    });
    setState(() {
      username = _usernameController.text.trim();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Username updated successfully')),
    );
  }

  Future<void> updatePassword() async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(_passwordController.text.trim());
      _passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating password: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: ClipPath(
                  clipper: DownTrapezoidClipper(),
                  child: Container(
                    width: 300,
                    height: 30,
                    color: const Color.fromARGB(255, 127, 255, 131),
                    alignment: Alignment.center,
                    child: const Text(
                      'Profile',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: 500,
                child: Image.asset('assets/images/account.png', height: 100),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Username:', style: TextStyle(fontSize: 15)),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: updateUsername,
                    child: const Text('Save Username'),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoField('Email:', email),
                  const SizedBox(height: 20),
                  const Text('New Password:', style: TextStyle(fontSize: 15)),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: updatePassword,
                    child: const Text('Update Password'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('Log out', () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }),
                  _buildActionButton('Delete Account', () {
                    showDialog(
                      context: context,
                      builder: (context) => _buildConfirmationDialog(
                        'Delete Account',
                        'Are you sure you want to delete this account?',
                        () async {
                          await FirebaseAuth.instance.currentUser?.delete();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 15)),
        Container(
          alignment: Alignment.centerLeft,
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value, style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildConfirmationDialog(String title, String content, VoidCallback onConfirm) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      contentPadding: const EdgeInsets.all(20),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(title == 'Delete Account' ? 'Delete' : 'Log out'),
            ),
          ],
        ),
      ],
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
