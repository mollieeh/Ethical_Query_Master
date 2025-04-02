import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

  // I don't know if this is needed?
  // History({super.key});'home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<History> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Stream<QuerySnapshot> getChats() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  void _goToPage(int page, int length) {
    if (page >= 0 && page < length) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = page;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
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
                    'History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: getChats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No chat history yet."));
                  }

                  final docs = snapshot.data!.docs;

                  return Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: docs.length,
                        itemBuilder: (_, index) {
                          final data = docs[index].data() as Map<String, dynamic>;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    data['stance']?.toUpperCase() ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black, width: 5),
                                    ),
                                    child: Text('Question:\n${data['question'] ?? ''}'),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black, width: 5),
                                    ),
                                    child: Text('Response:\n${data['response'] ?? ''}'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () => _goToPage(_currentPage - 1, docs.length),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () => _goToPage(_currentPage + 1, docs.length),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
