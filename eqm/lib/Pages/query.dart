import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'home.dart';
import 'results_query.dart';

class Query extends StatelessWidget 
{
  const Query({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: appBar(context),
      body: Column
      (
        children:
        [
          Center
          (
            child: ClipPath
            (
              clipper: DownTrapezoidClipper(),
              child: Container
              (
                width: 300,
                height: 30,
                color: const Color.fromARGB(255, 127, 255, 131),
                alignment: Alignment.center,
                child: const Text
                (
                  'Query',
                  style: TextStyle
                  (
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                )
              )
            ),
          ),
          Padding
          (
            padding: EdgeInsets.all(10),
          ),
          Center
          (
            child: TextField
            (
              textAlignVertical: TextAlignVertical(y: -1),
              autocorrect: true,
              maxLength: 500,
              decoration: InputDecoration
              (
                labelText: 'Ethical Question',
                constraints: BoxConstraints
                (
                  maxWidth: 450,
                  maxHeight: 300,
                ),
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              minLines: null,
              expands: true,
            )
          ),
          Padding
          (
            padding: EdgeInsets.all(10),
          ),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              Container
              (
                width: 100,
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
                        builder: (context) => ResultsQuery()
                      )
                    );
                  },
                  child: const Text
                  (
                    'For',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container
              (
                width: 100,
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
                        builder: (context) => ResultsQuery()
                      )
                    );
                  },
                  child: const Text
                  (
                    'Neutral',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container
              (
                width: 100,
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
                        builder: (context) => ResultsQuery()
                      )
                    );
                  },
                  child: const Text
                  (
                    'Against',
                    style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )
        ]
=======
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'home.dart';
import 'results_query.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  final TextEditingController _questionController = TextEditingController();
  bool _loading = false;

  Future<void> sendQuery(String stance) async {
    final question = _questionController.text.trim();
    if (question.isEmpty) return;

    setState(() => _loading = true);

    final apiKey = dotenv.env['OPENAI_API_KEY']; // 🔐
    final prompt = 'Answer the following ethical question with a $stance stance:\n"$question"';

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': 'You are an AI that gives ethical opinions and responds in 100 words or less.'},
          {'role': 'user', 'content': prompt},
        ],
        'temperature': 0.7,
      }),
    );

    setState(() => _loading = false);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final chatResponse = data['choices'][0]['message']['content'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsQuery(
            responseText: chatResponse,
            question: question,
            stance: stance,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text('Failed to get response: ${response.body}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text('Query', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Center(
              child: TextField(
                controller: _questionController,
                maxLength: 500,
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: 'Ethical Question',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 450, maxHeight: 300),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (_loading) const CircularProgressIndicator(),
            if (!_loading)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['For', 'Neutral', 'Against'].map((stance) {
                  return ElevatedButton(
                    onPressed: () => sendQuery(stance.toLowerCase()),
                    child: Text(stance),
                  );
                }).toList(),
              ),
          ],
        ),
>>>>>>> b313f72212986cb00ce15a107eddd7f95281bec5
      ),
    );
  }
}
<<<<<<< HEAD

class DownTrapezoidClipper extends CustomClipper<Path> 
{
  @override
  Path getClip(Size size) 
  {
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
=======
>>>>>>> b313f72212986cb00ce15a107eddd7f95281bec5
