import 'package:flutter/material.dart';

void main() {
  runApp(
    ChatScreenState(),
  );
}

String _name = "Your Name";

class ChatScreenState extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenState> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FriendlyChat 55'),
        ),
        body: Column(
          children: [
            Flexible(child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
          ],
        ),
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
                  focusNode: _focusNode,
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
    ChatMessage message = ChatMessage(
      text: value,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
  }
}


class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

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
