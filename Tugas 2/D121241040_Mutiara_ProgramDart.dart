import 'dart:io';

void main() {
  // 1. simpan data harga
  final Map<String, int> katalogHarga = {
    'Kemeja': 120000,
    'Celana Jeans': 200000,
    'Sepatu Sneaker': 300000,
    'Kaos Polos': 50000,
    'Topi': 35000,
    'Ikan Cupang': 50000,
  };

  // 2. simpan daftar belanja
  final Map<String, int> keranjangBelanja = {};

  tampilkanMenuKatalog(katalogHarga);

  //input user
  stdout.write('\nBerapa jenis barang yang ingin dibeli? ');
  int jumlahJenis = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  for (int i = 1; i <= jumlahJenis; i++) {
    print('\n[ Input Barang Ke-$i ]');
    stdout.write('Nama Barang  : ');
    String inputNama = (stdin.readLineSync() ?? '').trim();

    String matchedKey = katalogHarga.keys.firstWhere(
      (key) => key.toLowerCase() == inputNama.toLowerCase(),
      orElse: () => '',
    );

    if (matchedKey.isNotEmpty) {
      stdout.write('Jumlah Beli  : ');
      int qty = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      if (qty > 0) {
        keranjangBelanja[matchedKey] = (keranjangBelanja[matchedKey] ?? 0) + qty;
        print('-> Success: $matchedKey ($qty pcs) ditambahkan.');
      } else {
        print('-> Jumlah beli harus lebih dari 0.');
      }
    } else {
      print('-> Error: Barang "$inputNama" tidak ditemukan di daftar harga!');
    }
  }

  // Jika keranjang kosong, hentikan program
  if (keranjangBelanja.isEmpty) {
    print('\nTidak ada belanjaan yang diproses. Program selesai.');
    return;
  }

  // Hitung Subtotal
  int subtotal = hitungSubtotal(keranjangBelanja, katalogHarga);

  // 3. tentukan diskon
  double persenDiskon = hitungPersentaseDiskon(subtotal);
  int nominalDiskon = (subtotal * persenDiskon).round();

  // 4. tampilkan total belanja
  int totalAkhir = subtotal - nominalDiskon;

  cetakStrukPembayaran(
    keranjang: keranjangBelanja,
    katalog: katalogHarga,
    subtotal: subtotal,
    persenDiskon: persenDiskon,
    nominalDiskon: nominalDiskon,
    totalAkhir: totalAkhir,
  );
}

// fungsi pendukung

void tampilkanMenuKatalog(Map<String, int> katalog) {
  print('========================================');
  print('           KATALOG HARGA BARANG         ');
  print('========================================');
  katalog.forEach((barang, harga) {
    print('- ${barang.padRight(18)} : Rp $harga');
  });
}

int hitungSubtotal(Map<String, int> keranjang, Map<String, int> katalog) {
  int total = 0;
  keranjang.forEach((barang, qty) {
    int hargaSatuan = katalog[barang] ?? 0;
    total += hargaSatuan * qty;
  });
  return total;
}

double hitungPersentaseDiskon(int totalBelanja) {
  if (totalBelanja >= 500000) {
    return 0.20; // 20%
  } else if (totalBelanja >= 300000) {
    return 0.10; // 10%
  } else if (totalBelanja >= 100000) {
    return 0.05; // 5%
  } else {
    return 0.00; // 0%
  }
}

void cetakStrukPembayaran({
  required Map<String, int> keranjang,
  required Map<String, int> katalog,
  required int subtotal,
  required double persenDiskon,
  required int nominalDiskon,
  required int totalAkhir,
}) {
  print('\n========================================');
  print('            STRUK BELANJA APLIKASI      ');
  print('========================================');

  keranjang.forEach((barang, qty) {
    int harga = katalog[barang] ?? 0;
    int subtotalItem = harga * qty;
    print('${barang.padRight(15)} x$qty @ $harga = Rp $subtotalItem');
  });

  print('----------------------------------------');
  print('Subtotal           : Rp $subtotal');
  print('Diskon (${(persenDiskon * 100).toInt()}%)       : -Rp $nominalDiskon');
  print('========================================');
  print('TOTAL AKHIR        : Rp $totalAkhir');
  print('========================================');
}