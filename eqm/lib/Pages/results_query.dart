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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Response:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
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
