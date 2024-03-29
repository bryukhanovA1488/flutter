import 'dart:convert';

import 'package:flutter/material.dart';
import 'groups_screen.dart'; // Импортируем файл с экраном групп
import 'package:http/http.dart' as http;

class CompanysScreen extends StatefulWidget {
  @override
  _CompanysScreenState createState() => _CompanysScreenState();
}

Future<List<String>> fetchCompanys() async {
  var url = Uri.parse('http://C:/xampp/123/htdocs/api.php');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<String> companys = jsonDecode(response.body);
    return companys;
  } else {
    throw Exception('Failed to fetch companys');
  }
}

class _CompanysScreenState extends State<CompanysScreen> {

  List<String> companys = ['Comp 1', 'Comp 2'];

  @override
  void initState() {
  super.initState();
  fetchData(); // Вызов функции для загрузки данных о компаниях
  }

  void fetchData() async {
  try {
  List<String> fetchedCompanys = await fetchCompanys();
  setState(() {
  companys = fetchedCompanys;
  });
  } catch (e) {
  print('Error fetching companys: $e');
  }
  }

  void addCompany(String companyName) {
  setState(() {
  companys.add(companyName);
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text('Companys')),
  body: ListView.builder(
  itemCount: companys.length,
  itemBuilder: (context, index) {
  return ListTile(
  title: Text(companys[index]),
  onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => GroupsScreen()));
  },
  );
  },
  ),
  floatingActionButton: FloatingActionButton(
  onPressed: () {
  showDialog(
  context: context,
  builder: (context) {
  String companyName = '';
  return AlertDialog(
  title: Text('Add Company'),
  content: TextField(
  onChanged: (value) {
  companyName = value;
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
  if (companyName.isNotEmpty) {
  addCompany(companyName);
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
