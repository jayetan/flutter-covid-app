import 'package:covid19/provider/corona.dart';
import 'package:covid19/widgets/location_details.dart';
import 'package:covid19/widgets/overview_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _corona = Provider.of<CoronaProvider>(context);

    return (_corona.coronaOverview == null)
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OverviewCard(coronaOverview: _corona.coronaOverview),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: LocationDetails(
                  coronaDetail: _corona.coronaDetail,
                ),
              ),
            ),
          )
        ],
      );
  }
}
