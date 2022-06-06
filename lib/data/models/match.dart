import 'package:intl/intl.dart';

import '../repositories/web_services/constatnts.dart';

class MatchModel {
  final String id;
  final String team1;
  final String team2;
  final String team1ImageUrl;
  final String team2ImageUrl;
  final String dateTime;

  final int team1Score;
  final int team2Score;

  MatchModel({
    required this.id,
    required this.team1,
    required this.team2,
    required this.team1ImageUrl,
    required this.team2ImageUrl,
    required this.team1Score,
    required this.team2Score,
    required this.dateTime,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    String _getImage(int num) => "https://cdn.incub.space/v1/opp/icon/$num.png";

    DateTime time = DateTime.fromMillisecondsSinceEpoch(
        json[ApiConstants.matchTime] * 1000);
    List<String> scores = json[ApiConstants.score].split(':');

    return MatchModel(
      id: json[ApiConstants.matchId].toString(),
      team1: json[ApiConstants.team1Name],
      team2: json[ApiConstants.team2Name],
      team1ImageUrl: _getImage(json[ApiConstants.team1Icon]),
      team2ImageUrl: _getImage(json[ApiConstants.team2Icon]),
      team1Score: int.parse(scores[0]),
      team2Score: int.parse(scores[1]),
      dateTime: DateFormat('dd.MM').format(time).toString(),
    );
  }

  bool checkResults(int? team1Guess, int? team2Guess) {
    return team1Guess == team1Score && team2Guess == team2Score;
  }
  bool checkResultOneRight(int? team1Guess, int? team2Guess) {
    return team1Guess == team1Score || team2Guess == team2Score;
  }
}
