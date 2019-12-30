import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _headingTop() {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Text(
            "Happy Learning!",
            style: new TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _button(double width, String text) {
    return new Container(
      width: width / 2.5,
      height: 200,
      child: new Stack(
        children: <Widget>[
          new RotationTransition(
            turns: new AlwaysStoppedAnimation(-5 / 360),
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20),
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20),
              color: Theme.of(context).primaryColorLight,
            ),
            width: width / 2.5,
            height: 200,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new Text(
                    text,
                    style: TextStyle(
                        color: Color.fromRGBO(70, 71, 71, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _minionHalfRow(String animation, double width) {
    return new Expanded(
      child: new Center(
        child: new FlareActor(
          "assets/Minion.flr",
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          animation: animation,
        ),
      ),
    );
  }

  Widget _rowMathTables(double width) {
    return new Container(
      margin: EdgeInsets.only(top: 25),
      width: width,
      height: 200,
      child: new Row(
        children: <Widget>[
          _button(width, "Learn Tables\n\t 2 X 2 = 4"),
          _minionHalfRow("Wave", width)
        ],
      ),
    );
  }

  Widget _builddivider(width) {
    return new Container(
      margin: EdgeInsets.only(top: 50),
      width: width - 10,
      height: 0.5,
      color: Color.fromRGBO(70, 71, 71, 1),
    );
  }

  Widget _quizz(width) {
    return new Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Expanded(
            child: Container(
              width: 50,
              alignment: Alignment.bottomCenter,
              child: new FlareActor(
                "assets/Swipeup.flr",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "Up",
                color: Colors.black,
              ),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            width: width,
            height: 200,
            child: new Text(
              "Swipe up for Quizz",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: new SafeArea(
        child: new Container(
          padding: EdgeInsets.all(20),
          child: new Column(
            children: <Widget>[
              _headingTop(),
              _rowMathTables(width),
            ],
          ),
        ),
      ),
    );
  }
}
