import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2019/thread_model.dart';

import 'message_model.dart';

class ThreadDetailsScreen extends StatefulWidget {
  ThreadDetailsScreen({Key key, this.threadModel}) : super(key: key);
  final ThreadModel threadModel;
  _ThreadDetailsScreenState createState() => _ThreadDetailsScreenState();
}

class _ThreadDetailsScreenState extends State<ThreadDetailsScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void _handleSendButton() {
    print("Firebase");
    setState(() {
      widget.threadModel.messages.add(Message('cenas', _textEditingController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Message> msgs = widget.threadModel.messages;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.threadModel.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                height: 100.0,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(child: Text(widget.threadModel.description)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.threadModel.username),
                        Text(widget.threadModel.date.toString().split(' ').first),
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40.0,
                      ),
                      title: Text('Ola'), // Text(msgs[index].author),
                      subtitle: Text('Ola'), // Text(msgs[index].content),
                    ),
                itemCount: 100, //widget.threadModel.messages.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
              ),
            ),
            Column(
              children: <Widget>[
                Container(color: Colors.black, height: 1.0),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextField(
                    autocorrect: true,
                    controller: _textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _handleSendButton,
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
