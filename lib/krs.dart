import 'mahasiswa.dart';
import 'matakuliah.dart';

/// Class KRS merepresentasikan Kartu Rencana Studi mahasiswa.
class KRS {
  // Properties KRS
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = []; // Daftar mata kuliah yang diambil

  /// Constructor KRS
  KRS(this.mahasiswa);

  /// Menambahkan mata kuliah ke dalam KRS
  void tambahMataKuliah(MataKuliah mk) {
    daftarMataKuliah.add(mk);
    print("Mata Kuliah ${mk.nama} ditambahkan ke KRS ${mahasiswa.nama}");
  }

  /// Mencetak daftar mata kuliah dalam KRS
  void cetakKRS() {
    print(" === KRS MAHASISWA === ");
    print("Nama     : ${mahasiswa.nama}");
    print("NIM      : ${mahasiswa.nim}");
    print("Semester : ${mahasiswa.semester}");
    print("-- Daftar Mata Kuliah -- ");
    for (var mk in daftarMataKuliah) {
      print("- (${mk.kode}) ${mk.nama}, SKS : ${mk.sks}");
    }
  }
}
