import 'package:flutter/material.dart';
import '../../services/services.dart';

class TransaksiProvider{
  List<dynamic> transaksi = [];
  Future<void> getTransaksi({String nama_barang = '', String order = ''}) async {
    transaksi = await TransaksiApi().getData(nama_barang: nama_barang, order: order);
  }
}