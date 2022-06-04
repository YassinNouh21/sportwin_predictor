part of '../repositories/web_services/api_repository.dart';

class _MatchMapper {
  List<MatchModel> fromJson(_Json data) {
    List<MatchModel> matches = [];
    List<dynamic> body = data['body'];
    for (_Json json in body) {
      List<dynamic> events = json['events_list'];
      matches.addAll(events.map((e) => MatchModel.fromJson(e)));
    }
    return matches;
  }
}
