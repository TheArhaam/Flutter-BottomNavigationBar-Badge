import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  VoidCallback callback1;
  Function(String) func1;
  Page2({this.callback1, this.func1});
  @override
  State<StatefulWidget> createState() {
    return Page2State(callback2: () {
      callback1();
    }, func2: (string) {
      func1(string);
    });
  }
}

class Page2State extends State<Page2> {
  VoidCallback callback2;
  Function(String) func2;
  Page2State({this.callback2, this.func2});
  @override
  Widget build(BuildContext context) {
    return Page2Extra(callback3: () {
      callback2();
    }, func3: (string) {
      func2(string);
    });
  }
}

//JUST FOR THE SAKE OF AN EXAMPLE CREATING ON MORE CLASS
class Page2Extra extends StatefulWidget {
  VoidCallback callback3;
  Function(String) func3;
  Page2Extra({this.callback3, this.func3});
  @override
  State<StatefulWidget> createState() {
    return Page2ExtraState(callback4: () {
      callback3();
    }, func4: (string) {
      func3(string);
    });
  }
}

class Page2ExtraState extends State<Page2Extra> {
  VoidCallback callback4;
  Function(String) func4;
  Page2ExtraState({this.callback4, this.func4});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            callback4();
            func4('ADD');
          },
          child: Text('ADD'),
        ),
        RaisedButton(
          onPressed: () {
            callback4();
            func4('REMOVE');
          },
          child: Text('REMOVE'),
        ),
      ],
    );
  }
}
