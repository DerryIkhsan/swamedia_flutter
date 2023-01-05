import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swamedia_flutter/screen/employee/employee.dart';
import 'package:swamedia_flutter/screen/employee/employee_add.dart';
import 'package:swamedia_flutter/screen/transaksi/transaksi_report.dart';
import 'package:swamedia_flutter/services/services.dart';
import 'screen/transaksi/transaksi_provider.dart';
import 'screen/transaksi/transaksi_bloc.dart';
import 'screen/transaksi/transaksi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _searchTransaksi({String nama_barang = '', String order = ''}) {
    transaksiBloc.updateTransaksi(nama_barang: nama_barang, order: order);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F3F5),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Tambah',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeAdd(),));
                    },
                  ),
                ),
                Employee(),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
