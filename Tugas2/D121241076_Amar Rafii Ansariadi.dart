void main() {
  // 1. Menyimpan daftar harga (built-in type: Map<String, int>)
  Map<String, int> daftarHarga = {
    'Beras': 12000,
    'Minyak Goreng': 18000,
    'Gula': 14000,
    'Telur': 27000,
    'Kopi': 22000,
  };

  // 2. Menyimpan daftar belanjaan (nama barang & jumlah)
  Map<String, int> daftarBelanjaan = {
    'Beras': 2,
    'Minyak Goreng': 1,
    'Telur': 3,
  };

  // Hitung total belanja sebelum diskon
  double totalBelanja = hitungTotal(daftarBelanjaan, daftarHarga);

  // 3. Tentukan diskon berdasarkan total belanja
  double totalAkhir = hitungDiskon(totalBelanja);

  // 4. Tampilkan total akhir belanjaan
  print('=== Struk Belanja ===');
  daftarBelanjaan.forEach((barang, jumlah) {
    int harga = daftarHarga[barang]!;
    print('$barang x$jumlah = Rp${harga * jumlah}');
  });
  print('----------------------');
  print('Total belanja : Rp${totalBelanja.toStringAsFixed(0)}');
  print('Total akhir   : Rp${totalAkhir.toStringAsFixed(0)}');
}

// Function untuk menghitung total harga belanjaan
double hitungTotal(Map<String, int> belanjaan, Map<String, int> harga) {
  double total = 0;
  belanjaan.forEach((barang, jumlah) {
    total += harga[barang]! * jumlah;
  });
  return total;
}

// Function untuk menentukan case diskon berdasarkan total belanja
double hitungDiskon(double total) {
  double persenDiskon;

  if (total >= 100000) {
    persenDiskon = 0.20; // diskon 20% untuk belanja >= 100rb
  } else if (total >= 50000) {
    persenDiskon = 0.10; // diskon 10% untuk belanja >= 50rb
  } else if (total >= 20000) {
    persenDiskon = 0.05; // diskon 5% untuk belanja >= 20rb
  } else {
    persenDiskon = 0.0; // tidak ada diskon
  }

  double totalAkhir = total - (total * persenDiskon);
  return totalAkhir;
}