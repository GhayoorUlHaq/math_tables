import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import './home.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 300,
              height: 300,
              child: new FlareActor(
                "assets/Minion.flr",
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
                animation: "Dance",
              ),
            ),
            new Text(
              "Loading...",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
