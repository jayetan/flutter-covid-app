import 'package:covid19/provider/corona.dart';
import 'package:covid19/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (BuildContext context) => CoronaProvider(),
            ),
          ],
          child: Home(),
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}
