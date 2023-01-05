part of 'services.dart';

class TransaksiApi{
  Future<List<dynamic>> getData({String nama_barang = '', String order = ''}) async {
    var transaksiGet            = Uri.parse("$api");
    var responseTransaksiGet    = await http.get(transaksiGet);

    dynamic data;
    List<dynamic> resultGet     = [];

    if(responseTransaksiGet.statusCode == 200){
      data        = json.decode(responseTransaksiGet.body);
      resultGet   = data['result'] ?? [];
    }

    return resultGet;
  }

  Future<void> postData({String id_barang = '', String jumlah = ''}) async {
    bool saved        = false;
    var transaksiPost            = Uri.parse("$api/transaksi/post.php");
    var responseTransaksiPost    = await http.post(transaksiPost, body: {
      'id_barang': id_barang,
      'jumlah': jumlah
    });

    if(responseTransaksiPost.statusCode == 200){
      saved = true;
    }
  }

  Future<void> updateData({String id_transaksi = '', String id_barang = '', String jumlah = ''}) async {
    bool saved        = false;
    var transaksiPost            = Uri.parse("$api/transaksi/update.php");
    var responseTransaksiPost    = await http.post(transaksiPost, body: {
      'id_transaksi': id_transaksi,
      'id_barang': id_barang,
      'jumlah': jumlah
    });

    if(responseTransaksiPost.statusCode == 200){
      saved = true;
    }
  }

  Future<void> deleteData({String id_transaksi = ''}) async {
    bool saved        = false;
    var transaksiDelete            = Uri.parse("$api/transaksi/delete.php");
    var responseTransaksiDelete    = await http.post(transaksiDelete, body: {
      'id_transaksi': id_transaksi
    });

    if(responseTransaksiDelete.statusCode == 200){
      saved = true;
    }
  }

  Future<List<dynamic>> reportData() async {
    var reportPost            = Uri.parse("$api/transaksi/report.php");
    var responseReportPost    = await http.post(reportPost);

    dynamic data;
    List<dynamic> resultGet     = [];

    if(responseReportPost.statusCode == 200){
      data        = json.decode(responseReportPost.body);
      resultGet   = data['result'] ?? [];
    }

    return resultGet;
  }
}