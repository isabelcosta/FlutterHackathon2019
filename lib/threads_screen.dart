import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2019/thread_details_screen.dart';
import 'package:flutter_hackathon_2019/thread_model.dart';

class ThreadsScreen extends StatefulWidget {
  @override
  _ThreadsScreenState createState() => _ThreadsScreenState();
}

class _ThreadsScreenState extends State<ThreadsScreen> {
  void _createNewThread() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              constraints: BoxConstraints(maxHeight: 350.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Create a new thread',
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          maxLines: 1,
                          maxLength: 50,
                          decoration: InputDecoration(hintText: 'Title...'),
                        ),
                        TextField(
                          maxLines: null,
                          maxLength: 150,
                          decoration: InputDecoration(hintText: 'Description...'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('CANCEL'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('CREATE'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _createNewThread,
          )
        ],
        title: Text('Threads'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Scrollbar(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ThreadDetailsScreen(
                              threadModel: ThreadModel(
                            date: DateTime.now(),
                            description: 'Cenas',
                            title: 'Teste',
                            username: 'Miguel',
                            id: 1,
                          )))),
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Title',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'Description adsd asd asd as dasd asd asd as das das as das das das dasd a das das dsa das das das das as das das das das das as das das das das',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Username'),
                              Text('Date'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
