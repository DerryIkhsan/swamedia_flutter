part of 'services.dart';

class BarangApi{
  Future<List<dynamic>> getData({String nama_barang = '', String order = ''}) async {
    var barangGet            = Uri.parse("$api/barang/get.php");
    var responseBarangGet    = await http.get(barangGet);

    dynamic data;
    List<dynamic> resultGet     = [];

    if(responseBarangGet.statusCode == 200){
      data        = json.decode(responseBarangGet.body);
      resultGet   = data['result'] ?? [];
    }

    return resultGet;
  }
}