void main() {
  // 01. Menyimpan daftar harga (menggunakan built-in type: Map)
  Map<String, double> daftarHarga = {
    'buku': 35000.0,
    'pena': 5000.0,
    'tas': 150000.0,
    'sepatu': 250000.0
  };

  // 02. Menyimpan daftar belanjaan (menggunakan built-in type: List)
  List<String> daftarBelanjaan = ['buku', 'buku', 'pena', 'tas'];

  // Memanggil fungsi
  prosesBelanja(daftarBelanjaan, daftarHarga);
}

// Rule: Gunakan function
void prosesBelanja(List<String> belanjaan, Map<String, double> hargaBarang) {
  double totalAwal = 0.0;

  // Menghitung total harga sebelum diskon
  for (String barang in belanjaan) {
    if (hargaBarang.containsKey(barang)) {
      totalAwal += hargaBarang[barang]!; // '!' memastikan nilainya tidak null
    }
  }

  print('Total belanja awal: Rp $totalAwal');

  // 03. Menentukan case diskon belanjaan 
  // Rule: Gunakan if / else if / else & operator comparison (>=)
  double potongan = 0.0;
  
  if (totalAwal >= 500000) {
    print('Mendapatkan diskon 20%');
    potongan = totalAwal * 0.20;
  } else if (totalAwal >= 200000) {
    print('Mendapatkan diskon 10%');
    potongan = totalAwal * 0.10;
  } else {
    print('Tidak mendapatkan diskon');
    potongan = 0.0;
  }

  double totalAkhir = totalAwal - potongan;

  // 04. Menampilkan total akhir belanjaan
  print('Total potongan: Rp $potongan');
  print('Total akhir yang harus dibayar: Rp $totalAkhir');
}