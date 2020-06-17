import 'package:flutter/material.dart';
import './appbar.dart';

class Tables extends StatefulWidget {
  int number;
  int to;
  Tables(this.number, this.to);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  Widget _tableRow(int multiplaier, int numb) {
    return new Container(
      margin: EdgeInsets.only(top: 15),
      height: 70,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Text(
              "${widget.number}\t\tx\t\t${multiplaier}\t\t=\t\t${numb}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColorLight,
            blurRadius: 3.0, // has the effect of softening the shadow
            spreadRadius: 0.1, // has the effect of extending the shadow
            offset: Offset(
              0.1, // horizontal, move right 10
              0.1, // vertical, move down 10
            ),
          )
        ],
      ),
    );
  }

  Widget _printTable() {
    return new Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Column(
            children: <Widget>[
              for (var i = 1; i <= widget.to; i++)
                _tableRow(i, i * widget.number)
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: TolAppBar.getAppBar(
        context,
        "Table of ${widget.number} upto ${widget.to}",
      ),
      body: new SafeArea(
        child: new Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              _printTable(),
            ],
          ),
        ),
      ),
    );
  }
}
