class Mahasiswa {
  final String nim;
  final String nama;
  final String alamat;
  final String email;
  final String? hobi;
  final String? telepon;
  double? ipk;

  Mahasiswa({
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.email,
    this.hobi,
    this.telepon,
    this.ipk, 
  });
}