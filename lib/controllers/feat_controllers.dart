import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/team_models.dart';

class FeatController extends GetxController {
  var isLoading = false.obs;
  var isOffline = false.obs;

  // isinya Team, bukan PremierLeagueModel (PremierLeagueModel cuma pembungkus)
  final RxList<Team> teams = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    ambilTeams();
  }

  Future<void> ambilTeams() async {
    try {
      isLoading.value = true;

      final url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/123/'
        'search_all_teams.php?l=English%20Premier%20League',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = premierLeagueModelFromJson(response.body);
        teams.assignAll(data.teams);
        isOffline.value = false;
      } else {
        Get.snackbar('Error', 'Code : (${response.statusCode})');
        teams.assignAll(dataCadangan);
      }
    } catch (e) {
      isOffline.value = true;
      teams.assignAll(dataCadangan);
      Get.snackbar('Internet mu mati ndul', 'Silahkan sambungin ke internet');
    } finally {
      isLoading.value = false;
    }
  }

  // ---- data cadangan kalau internet mati ----
  final List<Team> dataCadangan = [
    Team(
      idTeam: '133604',
      strTeam: 'Arsenal',
      strStadium: 'Emirates Stadium',
      strBadge: '',
      strDescriptionEN: 'Klub asal London Utara, dijuluki The Gunners.',
    ),
    Team(
      idTeam: '133613',
      strTeam: 'Manchester City',
      strStadium: 'Etihad Stadium',
      strBadge: '',
      strDescriptionEN: 'Klub asal Manchester, dijuluki The Citizens.',
    ),
    Team(
      idTeam: '133602',
      strTeam: 'Liverpool',
      strStadium: 'Anfield',
      strBadge: '',
      strDescriptionEN: 'Klub asal Liverpool, dijuluki The Reds.',
    ),
    Team(
      idTeam: '133610',
      strTeam: 'Chelsea',
      strStadium: 'Stamford Bridge',
      strBadge: '',
      strDescriptionEN: 'Klub asal London, dijuluki The Blues.',
    ),
    Team(
      idTeam: '133612',
      strTeam: 'Manchester United',
      strStadium: 'Old Trafford',
      strBadge: '',
      strDescriptionEN: 'Klub asal Manchester, dijuluki The Red Devils.',
    ),
  ];
}
