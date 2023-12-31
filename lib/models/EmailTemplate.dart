import 'package:ed_call/data_diri_screen.dart';
import 'package:equatable/equatable.dart';

class EmailTemplate extends Equatable {
  final String targetEmail;
  final String nama;
  final String telepon;
  final String alamat;
  final Gender gender;
  final String kondisi;
  final String riwayatPerjalanan;
  final String vaksinasi;
  final Map<String, bool> gejala;
  final String gejalaLain;
  const EmailTemplate(
      {required this.targetEmail,
      required this.nama,
      required this.telepon,
      required this.alamat,
      required this.gender,
      required this.kondisi,
      required this.vaksinasi,
      required this.riwayatPerjalanan,
      required this.gejala,
      required this.gejalaLain});

  @override
  List<Object?> get props => [
        targetEmail,
        nama,
        telepon,
        alamat,
        gender,
        kondisi,
        riwayatPerjalanan,
        vaksinasi
      ];

  factory EmailTemplate.fromJson(Map<String, dynamic> json) {
    return EmailTemplate(
        targetEmail: json['targetEmail'],
        nama: json['nama'],
        telepon: json['telepon'],
        alamat: json['alamat'],
        gender: json['gender'],
        kondisi: json['kondisi'],
        vaksinasi: json['vaksinasi'],
        riwayatPerjalanan: json['riwayat_perjalanan'],
        gejala: json['gejala'],
        gejalaLain: json['lainnya']);
  }

  Map<String, dynamic> toJson() => {
        'targetEmail': targetEmail,
        'nama': nama,
        'telepon': telepon,
        'alamat': alamat,
        'gender': gender == Gender.laki_laki ? 'Laki-laki' : 'Perempuan',
        'kondisi': kondisi,
        'vaksinasi': vaksinasi,
        'riwayatPerjalanan': riwayatPerjalanan,
        'gejala': gejala,
        'gejalaLain': gejalaLain
      };
}
