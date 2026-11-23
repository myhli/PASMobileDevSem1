import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/detail_controllers.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    final m = controller.makanan;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Makanan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                m.gambar,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.fastfood, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              m.nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Rp ${m.harga}',
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(m.deskripsi),
            const Divider(height: 32),

            const Text(
              'Jumlah yang dibeli',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.txtJumlah,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Jumlah',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.hitung,
                child: const Text('HITUNG'),
              ),
            ),
            const Divider(height: 32),

            Obx(
              () => Column(
                children: [
                  _baris('Subtotal', 'Rp ${controller.subtotal.value.toStringAsFixed(0)}'),
                  _baris('PPN 5%', 'Rp ${controller.ppn.value.toStringAsFixed(0)}'),
                  const Divider(),
                  _baris(
                    'Total',
                    'Rp ${controller.total.value.toStringAsFixed(0)}',
                    bold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _baris(String label, String nilai, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: bold ? 18 : 14,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(nilai, style: style)],
      ),
    );
  }
}