import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import './table.dart';
import './appbar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

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

  TextEditingController _numberFieldController = TextEditingController();
  TextEditingController _toFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Required to continue',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            content: new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _numberFieldController,
                      decoration: InputDecoration(
                        hintText: "Enter table number",
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Table Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _toFieldController,
                      decoration: InputDecoration(
                        hintText: "Enter Lenght of table",
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Table Length';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('NEXT'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                     Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tables(
                          int.parse(_numberFieldController.text),
                          int.parse(_toFieldController.text),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          );
        });
  }

  Widget _gestureDetector(double width) {
    return new GestureDetector(
      child: _button(width, "Learn Tables\n\t 2 X 2 = 4"),
      onTap: () {
        _displayDialog(context);

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => Tables(7, 10),
        //   ),
        // );
      },
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
          _gestureDetector(width),
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
      appBar: TolAppBar.getAppBar(context, "Happy Learning"),
      body: new SafeArea(
        child: new Container(
          padding: EdgeInsets.all(20),
          child: new Column(
            children: <Widget>[
              _rowMathTables(width),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _numberFieldController.dispose();
    _toFieldController.dispose();
    super.dispose();
  }
}
