import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DashChatOption extends StatefulWidget {
  const DashChatOption({super.key});

  @override
  State<DashChatOption> createState() => _DashChatState();
}

class _DashChatState extends State<DashChatOption> {
  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'Solo',
    lastName: 'Ondul',
  );

  final ChatUser _aiUser = ChatUser(
    id: '2',
    firstName: 'Llama',
    lastName: '3.3',
    profileImage:
        'https://groq.com/wp-content/uploads/2024/03/Groq_Logo_Primary_Full-Color_RGB.png',
  );

  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  // Groq API Configuration
  final String _apiUrl = 'https://api.groq.com/openai/v1/chat/completions';
  final String _modelName = 'llama-3.3-70b-versatile';
  String get _apiKey => dotenv.env['GROQ_API_KEY'] ?? '';

  Future<void> _onSend(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    if (_apiKey.isEmpty) {
      _showError("API Key missing. Please check your .env file.");
      setState(() => _isTyping = false);
      return;
    }

    try {
      // Prepare history for Groq
      final history = _messages.reversed.map((m) {
        return {
          "role": m.user.id == _user.id ? "user" : "assistant",
          "content": m.text,
        };
      }).toList();

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": _modelName,
          "messages": [
            {"role": "system", "content": "You are a helpful AI assistant."},
            ...history,
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiText = data['choices'][0]['message']['content'];

        final aiMessage = ChatMessage(
          text: aiText,
          user: _aiUser,
          createdAt: DateTime.now(),
        );

        setState(() {
          _messages.insert(0, aiMessage);
        });
      } else {
        final error = jsonDecode(response.body);
        _showError(error['error']['message'] ?? "Unknown API Error");
      }
    } catch (e) {
      _showError("Connection Error: $e");
    } finally {
      setState(() => _isTyping = false);
    }
  }

  void _showError(String text) {
    final errorMessage = ChatMessage(
      text: "⚠️ $text",
      user: _aiUser,
      createdAt: DateTime.now(),
    );
    setState(() {
      _messages.insert(0, errorMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Chat AI'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: _onSend,
        messages: _messages,
        typingUsers: _isTyping ? [_aiUser] : [],
        messageOptions: const MessageOptions(
          showOtherUsersAvatar: true,
          showTime: true,
        ),
        inputOptions: const InputOptions(alwaysShowSend: true),
      ),
    );
  }
}
