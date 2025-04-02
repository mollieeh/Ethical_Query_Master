import 'package:flutter/material.dart';
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
      ),
    );
  }
}
