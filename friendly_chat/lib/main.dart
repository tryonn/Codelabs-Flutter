import 'package:flutter/material.dart';

void main() {
  runApp(
    FriendlyChatApp(),
  );
}

String _name = "Your Name";

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
          title: Text('FriendlyChat 55'),
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


class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name, style: Theme.of(context).textTheme.headline4),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
