import 'package:covid19/models/overview.dart';
import 'package:covid19/models/detail.dart';
import 'package:covid19/services/worldometers.dart';
import 'package:flutter/material.dart';

class CoronaProvider extends ChangeNotifier {
  final WorldoMeterService _worldoMeterService = WorldoMeterService();
  CoronaOverview _coronaOverview;
  List<CoronaDetail> _coronaDetail;

  CoronaProvider();

  fetchCoronaCase() async {
    _coronaOverview = await _worldoMeterService.fetchApi();
    notifyListeners();
  }

  fetchCoronaTable() async {
    _coronaDetail = await _worldoMeterService.fetchTable();
    notifyListeners();
  }

  CoronaOverview get coronaOverview => _coronaOverview;
  List<CoronaDetail> get coronaDetail => _coronaDetail;
}