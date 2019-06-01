import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JobsScreen extends StatefulWidget {
  JobsScreen({Key key}) : super(key: key);
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobFinder'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.only(
                  bottom: 20.0
              ),
              itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    right: 20.0
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      title: Text('Title Example'),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Description'),
                              RaisedButton(
                                child: Text('Contact'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Username'),
                              Text('Data'),
                            ]
                          )
                        ],


                      )
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}


