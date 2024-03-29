import 'package:flutter/material.dart';

import 'worker.dart';
class WorkersScreen extends StatefulWidget {
  @override
  _WorkersScreenState createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {

  List<Worker> workers = [
    Worker(name: 'a', email: 'mail1', phoneNumber: '1234567890', age: 123),
    Worker(name: 'b', email: 'mail2', phoneNumber: '9876543210', age: 456),
  ];

  void addWorker(String name, String email, String phoneNumber, int age) {
    setState(() {
      workers.add(Worker(name: name, email: email, phoneNumber: phoneNumber, age: age));
    });
  }

  void viewWorkerDetails(Worker worker) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Worker Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${worker.name}'),
              Text('Email: ${worker.email}'),
              Text('Phone Number: ${worker.phoneNumber}'),
              Text('Age: ${worker.age}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workers')),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(workers[index].name),
            onLongPress: () {
              viewWorkerDetails(workers[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String name = '';
              String email = '';
              String phoneNumber = '';
              String age = '';
              return AlertDialog(
                title: Text('Add Worker'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Age'),
                      onChanged: (value) {
                        age = value;
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (name.isNotEmpty && email.isNotEmpty && phoneNumber.isNotEmpty && age.isNotEmpty) {
                        addWorker(name, email, phoneNumber, int.parse(age));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


