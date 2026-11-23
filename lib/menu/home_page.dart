
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/list_makanan_controllers.dart';
import '../routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Makanan')),
      body: Obx(() {
        if (controller.makananList.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.builder(
          itemCount: controller.makananList.length,
          itemBuilder: (context, index) {
            final item = controller.makananList[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(

                leading: ClipRRect(

                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(

                    item.gambar,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.fastfood,
                      size: 40,
                      color: Colors.orange,

                    ),
                  ),
                ),
                
                title: Text(item.nama),
                subtitle: Text('Rp ${item.harga}'),

                trailing: const Icon(Icons.chevron_right),
                onTap: () {

                  Get.toNamed(Routes.detail, arguments: item);

                },
              ),
            );
          },
        );
      }),
    );
  }
}