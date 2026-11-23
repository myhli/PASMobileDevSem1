import 'package:get/get.dart';

import 'package:pas_mobiledev/models/makanan_models.dart';

class ListMakananController extends GetxController {
  final RxList<MakananModel> makananList = <MakananModel>[
    MakananModel(
      nama: 'Nasi Goreng Spesial',
      harga: 25000,
      deskripsi: 'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
      gambar: 'assets/uni.jpeg',
    ),
    MakananModel(
      nama: 'Mie Ayam Bakso',
      harga: 20000,
      deskripsi: 'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
      gambar: 'assets/uni.jpeg',
    ),
    MakananModel(
      nama: 'Sate Ayam Madura',
      harga: 28000,
      deskripsi: '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
      gambar: 'assets/uni.jpeg',
    ),
    MakananModel(
      nama: 'Ayam Bakar Madu',
      harga: 30000,
      deskripsi: 'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
      gambar: 'assets/uni.jpeg',
    ),
    MakananModel(
      nama: 'Es Teh Jumbo Manis',
      harga: 8000,
      deskripsi: 'Minuman teh melati segar dengan gula asli dan es batu kristal.',
      gambar: 'assets/uni.jpeg',
    ),
  ].obs;

  void hapus(int index) {
    makananList.removeAt(index);
    Get.snackbar('dihapus', 'produk hapus');
  }
}