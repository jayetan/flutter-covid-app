import 'package:html/dom.dart';

class CoronaOverview {
  final String total;
  final String deaths;
  final String recovered;
  final String lastUpdate;
  final Element news;

  CoronaOverview({ this.total, this.deaths, this.recovered, this.lastUpdate, this.news });

  CoronaOverview.fromJson(Map<String, dynamic> parsedJson)
    : total = parsedJson['total'],
      deaths = parsedJson['deaths'],
      recovered = parsedJson['recovered'],
      lastUpdate = parsedJson['last_update'],
      news = parsedJson['news'];
}