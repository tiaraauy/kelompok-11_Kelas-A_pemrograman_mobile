// ============================================================
// Tugas 2 - Dasar Pemrograman Dart
// Nama  : Muhammad Randy Muflih
// NIM   : D121241019
// Kelas : A - Pemrograman Mobile 2 (Kelompok 11)
// ============================================================

// BAGIAN 1: DAFTAR HARGA (katalog toko)
Map<String, int> daftarHarga = {
  'Beras 5kg': 75000,
  'Minyak Goreng 2L': 38000,
  'Gula Pasir 1kg': 16000,
  'Telur 1kg': 29000,
  'Kopi Bubuk 200g': 22000,
  'Sabun Mandi': 8500,
};

// BAGIAN 2: DAFTAR BELANJAAN (isi keranjang pembeli)
List<Map<String, dynamic>> daftarBelanja = [
  {'nama': 'Beras 5kg', 'jumlah': 2},
  {'nama': 'Minyak Goreng 2L', 'jumlah': 3},
  {'nama': 'Telur 1kg', 'jumlah': 2},
  {'nama': 'Kopi Bubuk 200g', 'jumlah': 4},
  {'nama': 'Sabun Mandi', 'jumlah': 5},
];

// BAGIAN 3a: Mengubah subtotal (rentang angka) menjadi kategori diskon
String tentukanKategori(int subtotal) {
  if (subtotal >= 500000) {
    return 'PLATINUM';
  } else if (subtotal >= 300000) {
    return 'GOLD';
  } else if (subtotal >= 100000) {
    return 'SILVER';
  } else {
    return 'REGULER';
  }
}

// BAGIAN 3b: Menentukan persentase diskon dengan SWITCH-CASE
double hitungDiskon(String kategori) {
  double persen;

  switch (kategori) {
    case 'PLATINUM':
      persen = 0.20; // belanja >= Rp500.000 -> diskon 20%
      break;
    case 'GOLD':
      persen = 0.15; // belanja >= Rp300.000 -> diskon 15%
      break;
    case 'SILVER':
      persen = 0.10; // belanja >= Rp100.000 -> diskon 10%
      break;
    default:
      persen = 0.0; // di bawah Rp100.000 -> tidak dapat diskon
  }

  return persen;
}

// FUNGSI BANTU: memformat angka menjadi format rupiah (Rp1.000.000)
String rupiah(num angka) {
  String angkaStr = angka.toStringAsFixed(0);
  String hasil = '';
  int hitung = 0;

  for (int i = angkaStr.length - 1; i >= 0; i--) {
    hasil = angkaStr[i] + hasil;
    hitung++;
    if (hitung % 3 == 0 && i != 0) {
      hasil = '.' + hasil;
    }
  }

  return 'Rp' + hasil;
}

void main() {
  print('==================================================');
  print('           STRUK BELANJA - TOKO SEMBAKO           ');
  print('==================================================');

  int subtotal = 0;

  // Perulangan menelusuri setiap barang di keranjang
  for (var item in daftarBelanja) {
    String nama = item['nama'];
    int jumlah = item['jumlah'];
    int harga = daftarHarga[nama] ?? 0; // ambil harga dari katalog
    int totalItem = harga * jumlah;

    subtotal += totalItem; // akumulasi ke subtotal

    print(nama.padRight(20) +
        jumlah.toString().padLeft(2) +
        ' x ' +
        rupiah(harga).padLeft(10) +
        ' = ' +
        rupiah(totalItem).padLeft(11));
  }

  // Hitung diskon
  String kategori = tentukanKategori(subtotal);
  double persen = hitungDiskon(kategori);
  double nilaiDiskon = subtotal * persen;
  double totalAkhir = subtotal - nilaiDiskon;

  String labelDiskon =
      'Diskon $kategori (' + (persen * 100).toStringAsFixed(0) + '%)';

  print('--------------------------------------------------');
  print('Subtotal'.padRight(34) + ': ' + rupiah(subtotal));
  print(labelDiskon.padRight(34) + ': -' + rupiah(nilaiDiskon));
  print('==================================================');
  print('TOTAL AKHIR'.padRight(34) + ': ' + rupiah(totalAkhir));
  print('==================================================');
}
