import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ikon_test/navigation.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigation.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(80),
            alignment: Alignment(10.0, 20.0),
            child: Center(
                child: AnimatedContainer(
              child: Image.asset('images/ikon.png'),
              curve: new Interval(0.8, 1.0, curve: Curves.elasticOut),
              duration: Duration(seconds: 4),
            )),
            color: Theme.of(context).primaryColorDark));
  }
}
