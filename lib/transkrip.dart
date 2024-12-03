import 'krs.dart';
import 'nilai.dart';
import 'matakuliah.dart';

class Transkrip extends KRS {
  List<Nilai> daftarNilai = []; // Menyimpan nilai mata kuliah

  Transkrip(super.mahasiswa);

  void tambahNilai(MataKuliah mk, double nilai) {
    double nilaiKonversi = konversiNilai(nilai); // Konversi nilai ke skala 1-4
    daftarNilai.add(Nilai(mk, nilaiKonversi));
    print(
        "Nilai untuk (${mk.kode}) ${mk.nama} berhasil ditambahkan: $nilai -> Indeks: $nilaiKonversi");
  }

  /// Konversi nilai dari skala 0-100 ke skala 1-4
  double konversiNilai(double nilai) {
    if (nilai >= 80 && nilai <= 100) {
      return 4.0; // A
    } else if (nilai >= 60 && nilai < 80) {
      return 3.0; // B
    } else if (nilai >= 40 && nilai < 60) {
      return 2.0; // C
    } else if (nilai >= 0 && nilai < 40) {
      return 1.0; // D
    } else {
      throw Exception("Nilai tidak valid: $nilai");
    }
  }

  /// Mencetak transkrip nilai
  void cetakTranskrip() {
    print("Nama : ${mahasiswa.nama}");
    print("NIM  : ${mahasiswa.nim}");
    double totalSKS = 0;
    double totalNilai = 0;

    print(" -- Daftar Nilai -- ");
    for (var nilai in daftarNilai) {
      print(
          "- ${nilai.mataKuliah.nama} (${nilai.mataKuliah.kode}), Nilai: ${nilai.nilai}");
      totalSKS += nilai.mataKuliah.sks;
      totalNilai += nilai.nilai * nilai.mataKuliah.sks;
    }

    double ipk = totalSKS > 0 ? totalNilai / totalSKS : 0;
    print("IPK: ${ipk.toStringAsFixed(2)}");
  }
}
