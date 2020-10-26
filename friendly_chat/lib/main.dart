import 'package:flutter/material.dart';

void main() {
  runApp(
    FriendlyChatApp(),
  );
}

class FriendlyChatApp extends StatefulWidget {
  @override
  _FriendlyChatAppState createState() => _FriendlyChatAppState();
}

class _FriendlyChatAppState extends State<FriendlyChatApp> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FriendlyChat'),
        ),
        body: _buildTextComposer(),
      ),
    );
  }

  Widget _buildTextComposer(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration.collapsed(hintText: 'Send a message'),
          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(icon: const Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text)),
          )
        ],
      )
    );
  }

  /*
  *
  * TextField(
        controller: _textController,
        onSubmitted: _handleSubmitted,
        decoration: InputDecoration.collapsed(hintText: 'Send a message'),
      ),
  * */

  void _handleSubmitted(String value) {
    _textController.clear();
  }
}