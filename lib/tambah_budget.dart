import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyTambahBudgetPage extends StatefulWidget {
  const MyTambahBudgetPage({super.key});

  @override
  State<MyTambahBudgetPage> createState() => _MyTambahBudgetPage();
}

class _MyTambahBudgetPage extends State<MyTambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaBudget = "";
  int _jumlahBudget = 0;
  String _statusBudget = "";
  bool statusPengeluaran = false;
  bool statusPemasukan = false;

  void submitForm(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final newBudget = Budget(_namaBudget, _jumlahBudget, _statusBudget);
    Provider.of<BudgetModel>(context, listen: false).add(newBudget);

    const snackBar = SnackBar(
      content: Text('Data Has Been Added!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Budget'),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.account_balance_wallet),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaBudget = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaBudget = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Maaf, judul tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 15000",
                      labelText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.attach_money_outlined),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _jumlahBudget = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _jumlahBudget = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListTile(
                          leading: Icon(Icons.check_box),
                          title: Text("Jenis Budget"),
                        ),
                        CheckboxListTile(
                          title: const Text('Pengeluaran'),
                          value: statusPengeluaran,
                          onChanged: (bool? value) {
                            setState(() {
                              statusPengeluaran = value!;
                              _statusBudget = "Pengeluaran";
                              if (value) {
                                statusPemasukan = false;
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Pemasukan'),
                          value: statusPemasukan,
                          onChanged: (bool? value) {
                            setState(() {
                              statusPemasukan = value!;
                              _statusBudget = "Pemasukkan";
                              if (value) {
                                statusPengeluaran = false;
                              }
                            });
                          },
                        ),
                        TextButton(
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Save"),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () => submitForm(context),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
