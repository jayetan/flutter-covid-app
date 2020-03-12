import 'package:covid19/provider/corona.dart';
import 'package:covid19/widgets/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

Future<Null> fetchApi(BuildContext context) async {
  var coronaProvider = Provider.of<CoronaProvider>(context, listen: false);
  coronaProvider.fetchCoronaCase();
  coronaProvider.fetchCoronaTable();
  return null;
}

class _HomeState extends State<Home> {
  bool isLoaded;
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    isLoaded = false;
    refreshKey = GlobalKey<RefreshIndicatorState>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      print('calling api');
      fetchApi(context);
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Monitoring'),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await fetchApi(context);
        },
        child: HomeWidget()
      )
    );
  }
}
