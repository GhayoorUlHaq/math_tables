import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
                animation: "Stand",
              ),
            ),
            new Text(
              "Loading...",
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            )
          ],
        ),
      ),
    );
  }
}
