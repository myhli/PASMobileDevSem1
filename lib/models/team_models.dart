// To parse this JSON data, do
//
//     final premierLeagueModel = premierLeagueModelFromJson(jsonString);

import 'dart:convert';

PremierLeagueModel premierLeagueModelFromJson(String str) =>
    PremierLeagueModel.fromJson(json.decode(str));

class PremierLeagueModel {
  final List<Team> teams;

  PremierLeagueModel({required this.teams});

  factory PremierLeagueModel.fromJson(Map<String, dynamic> json) =>
      PremierLeagueModel(
        teams: (json["teams"] as List<dynamic>? ?? [])
            .map((x) => Team.fromJson(x as Map<String, dynamic>))
            .toList(),
      );
}

class Team {
  final String idTeam;
  final String strTeam;
  final String strStadium;
  final String strBadge;

  final String strDescriptionEN;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strDescriptionEN,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        idTeam: json["idTeam"] ?? "",
        strTeam: json["strTeam"] ?? "",
        strStadium: json["strStadium"] ?? "",
        strBadge: json["strBadge"] ?? "",
        strDescriptionEN: json["strDescriptionEN"] ?? "",
      );
}
