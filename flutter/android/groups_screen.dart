import 'package:flutter/material.dart';
import 'workers_screen.dart'; // Импортируем файл с экраном воркеров

class GroupsScreen extends StatefulWidget {
  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  List<String> groups = ['Group 1', 'Group 2'];

  void addGroup(String groupName) {
  setState(() {
  groups.add(groupName);
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text('Groups')),
  body: ListView.builder(
  itemCount: groups.length,
  itemBuilder: (context, index) {
  return ListTile(
  title: Text(groups[index]),
  onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkersScreen()));
  },
  );
  },
  ),
  floatingActionButton: FloatingActionButton(
  onPressed: () {
  showDialog(
  context: context,
  builder: (context) {
  String groupName = '';
  return AlertDialog(
  title: Text('Add Group'),
  content: TextField(
  onChanged: (value) {
  groupName = value;
  },
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
  if (groupName.isNotEmpty) {
  addGroup(groupName);
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
