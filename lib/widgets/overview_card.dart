import 'package:covid19/models/overview.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final CoronaOverview coronaOverview;

  OverviewCard({@required this.coronaOverview});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${coronaOverview.lastUpdate}',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: ListTile(
                  title: Text('${coronaOverview.total}'),
                  subtitle: Text('Total'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListTile(
                  title: Text('${coronaOverview.deaths}'),
                  subtitle: Text('Deaths'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListTile(
                  title: Text('${coronaOverview.recovered}'),
                  subtitle: Text('Recovered'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
