import 'package:flutter/material.dart';
import 'package:delivoria/services/gemini_service.dart';

class DelivoBotPage extends StatefulWidget {
  const DelivoBotPage({super.key});

  @override
  State<DelivoBotPage> createState() => _DelivoBotPageState();
}

class _DelivoBotPageState extends State<DelivoBotPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  void sendMessage() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": input});
      _controller.clear();
    });

    final reply = await GeminiService.generateResponse(input);

    setState(() {
      messages.add({"role": "bot", "text": reply ?? "Maaf, coba lagi nanti."});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DelivoBot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.orangeAccent : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black87),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Tanyakan sesuatu..."),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
