import 'package:covid19/models/detail.dart';
import 'package:covid19/widgets/lable_text.dart';
import 'package:flutter/material.dart';

class LocationDetails extends StatelessWidget {
  final List<CoronaDetail> coronaDetail;

  LocationDetails({@required this.coronaDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var item in coronaDetail)
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${item.country}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          LabelTextWidget(
                            label: 'Total Cases: ',
                            text: '${item.totalCase}',
                          ),
                          LabelTextWidget(
                            label: 'Active Cases: ',
                            text: '${item.activeCases}',
                          ),
                          LabelTextWidget(
                            label: 'New Cases: ',
                            text: '${item.newCase}',
                          ),
                          LabelTextWidget(
                            label: 'Total Deaths: ',
                            text: '${item.totalDeaths}',
                          ),
                          LabelTextWidget(
                            label: 'New Deaths: ',
                            text: '${item.newDeaths}',
                          ),
                          LabelTextWidget(
                            label: 'Critical: ',
                            text: '${item.critical}',
                          ),
                          LabelTextWidget(
                            label: 'Total Recovered: ',
                            text: '${item.totalRecovered}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
      ],
    );
  }
}
