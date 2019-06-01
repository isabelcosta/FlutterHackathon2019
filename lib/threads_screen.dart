import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThreadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("Add thread");
            },
          )
        ],
        title: Text('Threads'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Scrollbar(
          child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (BuildContext context, int index) {
                return Card(
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
                );
              }),
        ),
      ),
    );
  }
}
