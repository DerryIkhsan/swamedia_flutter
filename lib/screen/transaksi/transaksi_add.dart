import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swamedia_flutter/screen/transaksi/transaksi_bloc.dart';
import 'package:swamedia_flutter/services/services.dart';

import '../../main.dart';

class TransaksiAdd extends StatefulWidget {
  @override
  _TransaksiAddState createState() => _TransaksiAddState();
}

class _TransaksiAddState extends State<TransaksiAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String idBarang = '1';
  TextEditingController jumlahController = TextEditingController();

  @override
  void dispose() {
    transaksiBloc.dispose();
    super.dispose();
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
              "Tambah Transaksi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 70,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  FutureBuilder(
                    future: BarangApi().getData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasData){
                        var data = snapshot.data!;

                        return DropdownButton<String>(
                          isExpanded: true,
                          value: idBarang,
                          onChanged: (value) {
                            setState(() {
                              idBarang = value.toString();  
                            });
                          },
                          items: data.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              child: Text(e['nama_barang']),
                              value: e['id_barang'],
                            );
                          }).toList(),
                        );
                      }

                      return Text("");
                    },
                  ),

                  TextFormField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your last name";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Input Jumlah',
                      labelText: 'Jumlah',
                    ),
                    onSaved: (value) {
                      jumlahController.text = value!;
                    },
                  ),
                  SizedBox(height: 75),
                  Row(
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
                      Spacer(),
                      RaisedButton.icon(
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {

                            await TransaksiApi()
                                .postData(id_barang: idBarang, jumlah: jumlahController.text);

                            await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => MyApp()));
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
