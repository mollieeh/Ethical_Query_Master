import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class ResultsQuery extends StatefulWidget {
  final String responseText;
  final String question;
  final String stance;

  const ResultsQuery({
    super.key,
    required this.responseText,
    required this.question,
    required this.stance,
  });

  @override
  State<ResultsQuery> createState() => _ResultsQueryState();
}

class _ResultsQueryState extends State<ResultsQuery> {
  @override
  void initState() {
    super.initState();
    saveChat();
  }

  Future<void> saveChat() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .add({
      'question': widget.question,
      'stance': widget.stance,
      'response': widget.responseText,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
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
                        'Response',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 10),
              Text(
                widget.responseText,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
