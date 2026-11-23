import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/team_models.dart';

class TeamDetailPage extends StatelessWidget {
  const TeamDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final team = Get.arguments as Team;

    return Scaffold(
      appBar: AppBar(title: Text(team.strTeam)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: team.strBadge.isEmpty
                  ? const Icon(Icons.sports_soccer, size: 100)
                  : Image.network(
                      team.strBadge,
                      height: 120,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.sports_soccer, size: 100),
                    ),
            ),
            const SizedBox(height: 16),
            Text(
              team.strTeam,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Stadion: ${team.strStadium}'),
            const Divider(height: 32),
            Text(team.strDescriptionEN),
          ],
        ),
      ),
    );
  }
}
