// import 'dart:async';
// import 'employee_provider.dart';

// class EmployeeBloc{
//   final EmployeeController = StreamController.broadcast();
//   final EmployeeProvider   = EmployeeProvider();

//   Stream get Employee => EmployeeController.stream;

//   void Employee({String nama_barang = '', String order = ''}){
//     EmployeeProvider.Employee(nama_barang: nama_barang, order: order);

//     if (!EmployeeController.isClosed) 
//     EmployeeController.sink.add(EmployeeProvider.Employee);
//   }

//   void dispose(){
//     EmployeeController.close();
//   }
// }

// final EmployeeBloc = EmployeeBloc();