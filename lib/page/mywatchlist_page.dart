import 'package:counter_7/data_budget.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  Future<List<Mywatchlist>> fetchToDo() async {
    var url = Uri.parse('https://mywatchlistjson-default-rtdb.firebaseio.com/');
    var response = await http.get(
    url,
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Mywatchlist> listToDo = [];
    for (var d in data) {
    if (d != null) {
        listToDo.add(Mywatchlist.fromJson(d));
    }
    }

    return listToDo;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Watch List'),
      ),
      drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyTambahBudgetPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDataBudgetPage()),
                  );
                },
              ),
              ListTile(
              title: const Text('My Watch Page'),
              onTap: () {
                  // Route menu ke halaman to do
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoPage()),
                  );
              },
              ),
            ],
          ),
        ),
      body: FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
              } else {
              if (!snapshot.hasData) {
                  return Column(
                  children: const [
                      Text(
                      "Tidak ada Watchlist :(",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                      ),
                      SizedBox(height: 8),
                  ],
                  );
              } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0
                          )
                          ]
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                              "${snapshot.data![index].title}",
                              style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].watched}"),
                          ],
                      ),
                      )
                  );
              }
              }
          }
      )
  );
  }
}
