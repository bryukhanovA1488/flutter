import 'package:flutter/material.dart';
import 'companys_screen.dart'; // Импортируйте файл с экраном компаний
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
// void fetchData() async {
//   var url = Uri.parse('http://C:/xampp/123/htdocs/api.php'); //  ссылка  скрипта
//   var response = await http.get(url);
//
//   if (response.statusCode == 200) {
//     // Обработка успешного ответа
//     print('Response: ${response.body}');
//   } else {
//     // Обработка ошибки
//     print('Request failed with status: ${response.statusCode}');
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work App',
      home: CompanysScreen(),
    );
  }
}