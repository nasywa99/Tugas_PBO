import 'dart:io';
import '../lib/mahasiswa.dart';
import '../lib/matakuliah.dart';
import '../lib/transkrip.dart';

void main() {
  // Membuat objek Mahasiswa menggunakan class Mahasiswa
  Mahasiswa mhs = Mahasiswa("230103146", "Nasywa Hamna Zakiya", 3);

  // Membuat objek MataKuliah menggunakan class MataKuliah
  MataKuliah mk1 = MataKuliah("MK001", "Pemrograman Berorientasi Objek", 3);
  MataKuliah mk2 = MataKuliah("MK002", "Matematika Diskrit", 3);
  MataKuliah mk3 = MataKuliah("MK003", "Statitika", 3);

  // Membuat objek Transkrip menggunakan inheritance dari KRS
  Transkrip transkrip = Transkrip(mhs);
  transkrip.tambahMataKuliah(mk1);
  transkrip.tambahMataKuliah(mk2);
  transkrip.tambahMataKuliah(mk3);

  // Menampilkan KRS mahasiswa
  transkrip.cetakKRS();

  // Input nilai mahasiswa
  print("\n=== Input Nilai Mahasiswa ===");
  for (var mk in transkrip.daftarMataKuliah) {
    print(
        "Masukkan nilai (skala 0-100) untuk mata kuliah (${mk.kode}) ${mk.nama} :");
    double? nilai = double.tryParse(stdin.readLineSync()!);

    // Validasi input nilai
    while (nilai == null || nilai < 0 || nilai > 100) {
      print("Nilai tidak valid. Masukkan angka antara 0 - 100.");
      nilai = double.tryParse(stdin.readLineSync()!);
    }

    transkrip.tambahNilai(mk, nilai); // Nilai akan dikonversi ke skala 1-4
  }

  // Menampilkan transkrip nilai mahasiswa
  print("\n=== Transkrip Nilai ===");
  transkrip.cetakTranskrip();
}
