import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hackathon_2019/job_model.dart';

class JobsScreen extends StatefulWidget {
  JobsScreen({Key key}) : super(key: key);

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {

  List<JobModel> jobsList = List();

  _JobsScreenState () {
    jobsList.add(JobModel('Title', 'Description', 'random_email@example.com', DateTime(2019, 3, 3)));
    jobsList.add(JobModel('Title_2', 'Description_2', 'random_email_2@example.com', DateTime(2019, 12, 16)));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('JobFinder'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
                _showDialog();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
              itemCount: jobsList.length,
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
                      title: Text(jobsList[index].title),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(jobsList[index].description),
                              RaisedButton(
                                child: Text('Contact'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Username'),
                              Text(jobsList[index].dateTime.toString()),
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

  void _showDialog() {

    JobModel job = JobModel();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Job'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter job title'
                ),
                onChanged: (String textTyped) {
                  job.title = textTyped;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter job description'
                ),
                onChanged: (String textTyped) {
                  job.description = textTyped;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter job email'
                ),
                onChanged: (String textTyped) {
                  job.email = textTyped;
                },
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Create"),
              onPressed: () {
                setState((){
                  job.dateTime = DateTime.now();
                  jobsList.add(job);
                  print(job.title);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
