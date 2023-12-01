// membuat data dan menampilkan dlm aplikasi

class Makanan {
  // final : objek telah dibuat, value tdk bisa diubah
  final String nama; // properti
  final String deskripsi;
  final String gambar;
  final String detail;
  final String waktubuka;
  final String harga;
  final String kalori;
  final List<String> gambarlain;
  final List<Map<String, String>> bahan;

// constructor named parameter {}
  Makanan(
      {required this.nama,
      required this.harga,
      required this.gambarlain,
      required this.waktubuka,
      required this.detail,
      required this.kalori,
      required this.bahan,
      required this.deskripsi,
      required this.gambar});

/* Terdapat sebuah method factory dgn nama Makanan.fromJson
   Method ini digunakan utk membuat objek Makanan dari data yg diterima dlm bentuk Map<String, dynamic>
   Biasanya digunakan ketika ingin mengonversi data JSON mjd objek dart */

/* Atribut nama, deskripsi, detail, waktubuka, harga, kalori, dan gambar diambil dari nilai-nilai yang sesuai dalam json */
/* Atribut gambarlain diinisialisasi dengan list yang berisi URL gambar tambahan dari nilai yang ada dalam json */
/* Atribut bahan diinisialisasi dengan list dari map yang mewakili bahan-bahan. Data ini diambil dari json dan diubah menjadi tipe yang sesuai */

  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      nama: json["nama"],
      deskripsi: json["deskripsi"],
      detail: json["detail"],
      waktubuka: json["waktubuka"],
      harga: json["harga"],
      kalori: json["kalori"],
      gambar: json["gambar"],
      gambarlain: List<String>.from(json["gambarlain"]),
      bahan: List<Map<String, String>>.from(json["bahan"].map((x) => Map.from(x)
          .map((key, value) => MapEntry<String, String>(key, value)))),
    );
  }
}
