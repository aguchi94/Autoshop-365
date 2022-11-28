import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendPage extends StatefulWidget {
  const BackendPage({Key? key}) : super(key: key);

  @override
  State<BackendPage> createState() => _BackendPageState();
}

class _BackendPageState extends State<BackendPage> {
  late Map data;
  late List usersData;

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://a365.com.ar/api/users'));
    data = json.decode(response.body);
    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh)),
        title: Text('User List'),
      ),
      body: ListView.builder(
          itemCount: usersData == null ? 0 : usersData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Nombre: '),
                      Text('${usersData[index]['nombre']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Apellido: '),
                      Text('${usersData[index]['apellido']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('ID: '),
                      Text('${usersData[index]['_id']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Usuario: '),
                      Text('${usersData[index]['usuario']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Pass: '),
                      Text('${usersData[index]['pass']}'),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
