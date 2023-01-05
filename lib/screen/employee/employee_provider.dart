import 'package:flutter/material.dart';
import '../../services/services.dart';

class EmployeeProvider{
  List<dynamic> employee = [];
  Future<void> getTransaksi({String nama_barang = '', String order = ''}) async {
    employee = await EmployeeApi().getData();
  }
}