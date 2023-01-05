part of 'services.dart';

class EmployeeApi{
  Future<List<dynamic>> getData() async {
    var transaksiGet            = Uri.parse("$api");
    var responseTransaksiGet    = await http.get(transaksiGet);

    dynamic data;
    List<dynamic> resultGet     = [];

    if(responseTransaksiGet.statusCode == 200){
      data        = json.decode(responseTransaksiGet.body);
      resultGet   = data['data'] ?? [];

      print(resultGet);
    }

    return resultGet;
  }

  Future<void> postData({String name = '', String nik = '', String position = ''}) async {
    bool saved        = false;
    var employeePost            = Uri.parse("$api");
    await http.post(employeePost, body: {
      'name': name,
      'nik': nik,
      'position': position
    });

    // if(responseEmployeePost.statusCode == 200){
    //   saved = true;
    // }
  }

  // Future<void> updateData({String id_transaksi = '', String id_barang = '', String jumlah = ''}) async {
  //   bool saved        = false;
  //   var transaksiPost            = Uri.parse("$api/transaksi/update.php");
  //   var responseTransaksiPost    = await http.post(transaksiPost, body: {
  //     'id_transaksi': id_transaksi,
  //     'id_barang': id_barang,
  //     'jumlah': jumlah
  //   });

  //   if(responseTransaksiPost.statusCode == 200){
  //     saved = true;
  //   }
  // }

    Future<void> detailData({String id = ''}) async {
    bool saved        = false;
    var employeeDelete            = Uri.parse("$api/$id");
    var responseemployeeDelete    = await http.delete(employeeDelete);

    if(responseemployeeDelete.statusCode == 200){
      saved = true;
    }
  }

  Future<void> deleteData({String id = ''}) async {
    bool saved        = false;
    var employeeDelete            = Uri.parse("$api/$id");
    var responseEmployeeDelete    = await http.put(employeeDelete);

    if(responseEmployeeDelete.statusCode == 200){
      saved = true;
    }
  }

  // Future<List<dynamic>> reportData() async {
  //   var reportPost            = Uri.parse("$api/transaksi/report.php");
  //   var responseReportPost    = await http.post(reportPost);

  //   dynamic data;
  //   List<dynamic> resultGet     = [];

  //   if(responseReportPost.statusCode == 200){
  //     data        = json.decode(responseReportPost.body);
  //     resultGet   = data['result'] ?? [];
  //   }

  //   return resultGet;
  // }
}