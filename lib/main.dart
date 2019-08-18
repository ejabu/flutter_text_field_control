import 'package:flutter/material.dart';
import 'package:flutter_text_field_control/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Control Text"),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SearchBar(),
                  SpecialChar(
                    btnVal: "ack",
                  ),
                  SpecialChar(
                    btnVal: "erflow",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
