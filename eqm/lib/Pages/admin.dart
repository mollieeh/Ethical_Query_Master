import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _promoteEmailController = TextEditingController();
  bool _accessDenied = false;
  DocumentSnapshot? _userDoc;
  QuerySnapshot? _userChats;

  final String defaultAdminEmail = 'admin@example.com';

  @override
  void initState() {
    super.initState();
    _checkAdminAccess();
  }

  Future<void> _checkAdminAccess() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final email = FirebaseAuth.instance.currentUser?.email;

    if (uid == null || email == null) return;

    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final doc = await docRef.get();

    // Auto-assign admin to default email if not yet set
    if (email == defaultAdminEmail && (!doc.exists || doc['isAdmin'] != true)) {
      await docRef.set({'isAdmin': true}, SetOptions(merge: true));
    }

    if (doc.exists && doc['isAdmin'] == true) {
      setState(() => _accessDenied = false);
    } else {
      setState(() => _accessDenied = true);
    }
  }

  Future<void> _lookupUser() async {
    final email = _searchController.text.trim();
    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (userQuery.docs.isNotEmpty) {
      final doc = userQuery.docs.first;
      final chats = await FirebaseFirestore.instance
          .collection('users')
          .doc(doc.id)
          .collection('chats')
          .orderBy('timestamp', descending: true)
          .get();

      setState(() {
        _userDoc = doc;
        _userChats = chats;
      });
    } else {
      setState(() {
        _userDoc = null;
        _userChats = null;
      });
    }
  }

  Future<void> _promoteToAdmin() async {
    final email = _promoteEmailController.text.trim();
    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (userQuery.docs.isNotEmpty) {
      final uid = userQuery.docs.first.id;
      await FirebaseFirestore.instance.collection('users').doc(uid).set(
        {'isAdmin': true},
        SetOptions(merge: true),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$email has been promoted to admin')),
      );
      _promoteEmailController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not found')),
      );
    }
  }

  Future<void> _deleteUserAccount(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    setState(() {
      _userDoc = null;
      _userChats = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User deleted from Firestore')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_accessDenied) {
      return const Scaffold(
        body: Center(child: Text('Access Denied')),
      );
    }

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
                      'Admin',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// 🔍 User Lookup
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Find user by email',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _lookupUser,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              /// 👑 Promote to Admin
              TextField(
                controller: _promoteEmailController,
                decoration: InputDecoration(
                  labelText: 'Promote user to admin (email)',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.upgrade),
                    onPressed: _promoteToAdmin,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              /// 📄 User Info + Actions
              if (_userDoc != null) ...[
                ListTile(
                  title: Text(_userDoc!['username'] ?? 'No username'),
                  subtitle: Text(_userDoc!['email'] ?? 'No email'),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      if (_userDoc?['isAdmin'] == true) {
                        showDialog(
                          context: context,
                          builder: (_) => const AlertDialog(
                            title: Text('Cannot Delete Admin'),
                            content: Text('You cannot delete another admin account.'),
                          ),
                        );
                        return;
                      }
                      await _deleteUserAccount(_userDoc!.id);
                    },
                    child: const Text('Delete User'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const Divider(),

                /// 🧠 Chat History
                const Text('Chat History:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                if (_userChats != null)
                  ..._userChats!.docs.map((chat) {
                    final data = chat.data() as Map<String, dynamic>;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Stance: ${data['stance'] ?? ''}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text('Q: ${data['question'] ?? ''}'),
                            const SizedBox(height: 5),
                            Text('A: ${data['response'] ?? ''}'),
                          ],
                        ),
                      ),
                    );
                  }),
              ]
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