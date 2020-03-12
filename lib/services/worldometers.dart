import 'package:covid19/models/overview.dart';
import 'package:covid19/models/detail.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class WorldoMeterService {
  final String _url = 'https://www.worldometers.info/coronavirus/';

  Future<CoronaOverview>fetchApi() async {
    var response = await http.get(_url);

    var document = parse(response.body);
    List<Element> mainCounter = document.querySelectorAll('#maincounter-wrap > .maincounter-number > span');
    List<Element> contentInner = document.querySelectorAll('.content-inner > div');

    Map<String, dynamic> linkMap = {
      "total": mainCounter[0].text,
      "deaths": mainCounter[1].text,
      "recovered": mainCounter[2].text,
      "last_update": contentInner[1].text,
    };

    return CoronaOverview.fromJson(linkMap);
  }

  Future<List<CoronaDetail>>fetchTable() async {
    var response = await http.get(_url);

    var document = parse(response.body);
    List<Element> table = document.querySelectorAll('#main_table_countries > tbody > tr');
    List<Map<String, dynamic>> linkMap = [];

    for (var i = 0; i < table.length; i++) {
      var td = table[i].querySelectorAll('td');
      linkMap.add({
        "country": td[0].text.trim(),
        "total_case": td[1].text.trim(),
        "new_case": td[2].text.trim(),
        "total_deaths": td[3].text.trim(),
        "new_deaths": td[4].text.trim(),
        "total_recovered": td[5].text.trim(),
        "active_cases": td[6].text.trim(),
        "critical": td[7].text.trim(),
      });
    }
    return linkMap.map((item) => CoronaDetail.fromJson(item)).toList();
  }

}