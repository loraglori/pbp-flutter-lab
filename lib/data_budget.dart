import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:provider/provider.dart';

class MyDataBudgetPage extends StatefulWidget {
    const MyDataBudgetPage({super.key});

    @override
    State<MyDataBudgetPage> createState() => _MyDataBudgetPage();
}

class _MyDataBudgetPage extends State<MyDataBudgetPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),

            //Drawer
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
                  ],
                ),
              ),

            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Hello World!'),
                    ],
                ),
            ),
        );
    }
}