import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/feat_controllers.dart';
import '../routes.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premier League')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.teams.isEmpty) {
          return const Center(child: Text('Data tidak ditemukan'));
        }

        return RefreshIndicator(
          onRefresh: controller.ambilTeams,
          child: ListView.builder(
            itemCount: controller.teams.length,
            itemBuilder: (context, index) {
              final team = controller.teams[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: SizedBox(
                    width: 45,
                    height: 45,
                    child: team.strBadge.isEmpty
                        ? const Icon(Icons.sports_soccer)
                        : Image.network(
                            team.strBadge,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.sports_soccer),
                          ),
                  ),
                  title: Text(team.strTeam),
                  subtitle: Text(team.strStadium),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Get.toNamed(Routes.teamDetail, arguments: team);
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
