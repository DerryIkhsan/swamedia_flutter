import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swamedia_flutter/screen/employee/employee_bloc.dart';
import 'package:swamedia_flutter/services/services.dart';

import '../../main.dart';

class EmployeeAdd extends StatefulWidget {
  @override
  _EmployeeAddState createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  @override
  void dispose() {
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
              "Tambah Employee",
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
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Input Name',
                      labelText: 'Name',
                    ),
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                  ),
                  SizedBox(height: 75),
                  TextFormField(
                    controller: nikController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your nik";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Input NIK',
                      labelText: 'NIK',
                    ),
                    onSaved: (value) {
                      nikController.text = value!;
                    },
                  ),
                  SizedBox(height: 75),
                  TextFormField(
                    controller: positionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your position";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Input Position',
                      labelText: 'Position',
                    ),
                    onSaved: (value) {
                      positionController.text = value!;
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
                            await EmployeeApi().postData(
                                name: nameController.text,
                                nik: nikController.text,
                                position: positionController.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => HomeScreen()));
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
