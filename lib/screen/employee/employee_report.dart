import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swamedia_flutter/screen/transaksi/transaksi_bloc.dart';
import 'package:swamedia_flutter/services/services.dart';

import '../../main.dart';

class TransaksiReport extends StatefulWidget {
  @override
  _TransaksiReportState createState() => _TransaksiReportState();
}

class _TransaksiReportState extends State<TransaksiReport> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String idBarang = '1';
  TextEditingController jumlahController = TextEditingController();
  List<dynamic> report = [];

  void _reportTransaksi() async {
    report = await TransaksiApi().reportData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reportTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 120),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Laporan Transaksi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(report.length, (index) {
                return Container(
                  width: 160,
                  height: 180,
                  decoration: BoxDecoration(
                      color: index == 0 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          report[index]['data'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          report[index]['nama_barang'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Penjualan: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              report[index]['total'] + " item",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton.icon(
                  color: Colors.red,
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
