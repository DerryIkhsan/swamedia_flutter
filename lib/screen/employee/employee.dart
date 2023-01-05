import 'package:flutter/material.dart';
import 'package:swamedia_flutter/screen/employee/employee_provider.dart';
import 'package:swamedia_flutter/services/services.dart';
import 'employee_update.dart';
import '../../main.dart';
import 'employee_bloc.dart';
import 'employee_update.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  void dispose() {
    // EmployeeBloc.dispose();
    super.dispose();
  }

  // void _searchEmployee({String nama_barang = '', String order = ''}) {
  //   EmployeeBloc.updateEmployee(nama_barang: nama_barang, order: order);
  // }

  @override
  void initState() {
    super.initState();
    EmployeeApi().getData();
    // setState(() {
    //   _searchEmployee(nama_barang: '');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // initialData: EmployeeApi().getData(),
      future: EmployeeApi().getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
                height: 205,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.black.withOpacity(.6),
                    )
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${snapshot.data?[index]['name']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${snapshot.data?[index]['nik']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${snapshot.data?[index]['position']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            child: RaisedButton.icon(
                              color: Colors.green,
                              onPressed: () async {
                              
                                Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => EmployeeUpdate(
                                      id: snapshot.data?[index]['id'],
                                      name: snapshot.data?[index]['name'],
                                      nik: snapshot.data?[index]['nik'],
                                      position: snapshot.data?[index]['position'],
                                    )));

                              },
                              icon: Icon(Icons.edit, color: Colors.white,),
                              label: Text("Ubah",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 7,),
                          SizedBox(
                            height: 30,
                            child: RaisedButton.icon(
                              color: Colors.red,
                              onPressed: () async {
                                await EmployeeApi().deleteData(id: snapshot.data?[index]['id']);
                              
                                await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => MyApp()));

                              },
                              icon: Icon(Icons.cancel, color: Colors.white,),
                              label: Text("Hapus",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        // return Text("");
      },
    );
  }
}
