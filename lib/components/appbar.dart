import 'package:flutter/material.dart';

class TolAppBar {
  static getAppBar(BuildContext context, String title) {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: new Text(
        title,
        style: new TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.assignment,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
    );
  }
}
