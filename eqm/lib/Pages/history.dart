import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late final PageController _pageController;
  int _currentPage = 0;
  List<DocumentSnapshot> _chatDocs = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _loadChats();
  }

  Future<void> _loadChats() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .get();

    setState(() {
      _chatDocs = snapshot.docs;
    });
  }

  void _changePage(int offset) {
    final target = _currentPage + offset;

    if (target >= 0 && target < _chatDocs.length) {
      _pageController
          .animateToPage(
            target,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .then((_) {
        setState(() {
          _currentPage = target;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: _chatDocs.isEmpty
            ? const Center(child: Text("No chat history found."))
            : Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _chatDocs.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (_, index) {
                      return HistoryCard(
                        data: _chatDocs[index].data() as Map<String, dynamic>,
                        index: index,
                        total: _chatDocs.length,
                      );
                    },
                  ),
                  Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        iconSize: 30,
                        onPressed: () => _changePage(-1),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                        iconSize: 30,
                        onPressed: () => _changePage(1),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final int index;
  final int total;

  const HistoryCard({
    super.key,
    required this.data,
    required this.index,
    required this.total,
  });

  String get truncatedResponse {
    final response = data['response']?.toString() ?? '';
    return response.length > 300 ? '${response.substring(0, 300)}...' : response;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page: ${index + 1} of $total',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data['stance']?.toUpperCase() ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Text('Question:\n${data['question'] ?? ''}'),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Text('Response:\n$truncatedResponse'),
            ),
          ],
        ),
      ),
    );
  }
}
