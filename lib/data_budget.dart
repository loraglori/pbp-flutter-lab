import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
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
      title: const Text('Data Budget'),
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
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: '',
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyTambahBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyDataBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<BudgetModel>(builder: (context, value, child) {
          return ListView.builder( // Scrolling Widget
            itemCount: value.budgets.length, // banyak barang di List
            itemBuilder: ((context, index) {
              var item = value.budgets[index];

              return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.hashCode.toString(), style: const TextStyle(fontSize: 26)),
                      const SizedBox(width: 300, height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Text(item._jumlahBudget.toString()),
                          //Text(item._statusBudget),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      )
    );
  }
}