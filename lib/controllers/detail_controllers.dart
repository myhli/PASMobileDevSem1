import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/makanan_models.dart';

class DetailController extends GetxController {
  late final MakananModel makanan;

  final txtJumlah = TextEditingController();

  final subtotal = 0.0.obs;
  final ppn = 0.0.obs;
  final total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    makanan = Get.arguments as MakananModel;
  }

  void hitung() {
    final jumlah = int.tryParse(txtJumlah.text) ?? 0;

    if (jumlah <= 0) {
      Get.snackbar('Peringatan', 'Jumlah harus lebih dari 0');
      return;
    }

    subtotal.value = makanan.harga * jumlah.toDouble();
    ppn.value = subtotal.value * 0.05;        
    total.value = subtotal.value + ppn.value; 
  }

  @override
  void onClose() {
    txtJumlah.dispose();
    super.onClose();
  }
}