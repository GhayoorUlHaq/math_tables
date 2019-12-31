import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  Tables({Key key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  Widget _headingTop() {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Text(
            "Happy Learning!",
            style: new TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new Container(
          color: Theme.of(context).primaryColorDark,
          child: Column(
            children: <Widget>[
              _headingTop()],
          ),
        ),
      ),
    );
  }
}
