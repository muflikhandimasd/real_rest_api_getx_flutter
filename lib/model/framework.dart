// class Framework {
//   int id;
//   String nama_barang;
//   int stok;
//   int jumlah_terjual;
//   String jenis_barang;
//   DateTime tanggal_transaksi;

//   Framework({
//     this.id,
//     this.nama_barang,
//     this.stok,
//     this.jumlah_terjual,
//     this.jenis_barang,
//     this.tanggal_transaksi,
//   });

//   Framework.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nama_barang:
//     json['nama_barang'];
//     stok:
//     json['stok'];
//     jumlah_terjual:
//     json['jumlah_terjual'];
//     jenis_barang:
//     json['jenis_barang'];
//     tanggal_transaksi:
//     DateTime.parse(json['tanggal_transaksi']);
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'nama_barang': nama_barang,
//         'stok': stok,
//         'jumlah_terjual': jumlah_terjual,
//         'jenis_barang': jenis_barang,
//         'jenis_barang': tanggal_transaksi
//       };
// }

// ignore_for_file: non_constant_identifier_names

class Framework {
  int id;
  String nama_barang;
  int stok;
  int jumlah_terjual;
  String jenis_barang;
  DateTime tanggal_transaksi;

  Framework({
    this.id,
    this.nama_barang,
    this.stok,
    this.jumlah_terjual,
    this.jenis_barang,
    this.tanggal_transaksi,
  });

  Framework.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_barang = json['nama_barang'];
    stok = json['stok'];
    jumlah_terjual = json['jumlah_terjual'];
    jenis_barang = json['jenis_barang'];
    tanggal_transaksi = DateTime.parse(json['tanggal_transaksi']);
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nama_barang'] = nama_barang;
    data['stok'] = stok;
    data['jumlah_terjual'] = jumlah_terjual;
    data['jenis_barang'] = jenis_barang;
    data['tanggal_transaksi'] = tanggal_transaksi.toIso8601String();
    return data;
  }
}
