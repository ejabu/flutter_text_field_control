import 'package:flutter/material.dart';

import 'a_screen/button_add.dart';
import 'b_screen/auto_call_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Control',
      home: BaseScreen(),
    );
  }
}


class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tricky Layouts'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  Dividers(),
                  ScreenButton(
                    title: "A-1. add new Characters in TextField",
                    subtitle: "From another widget (e.g button)",
                    child: ButtonAddScreen(),
                  ),

                  Dividers(),
                  ScreenButton(
                    title: "A-2. Auto Call API",
                    subtitle: "By listening to certain characters",
                    child: AutoCallApi(),
                  ),
                  
                  Dividers(),
                  SizedBox(height: 20),
                  
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ScreenButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const ScreenButton({
    this.title,
    this.subtitle,
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title"),
      subtitle: subtitle != null ? Text("$subtitle") : null,
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return child;
            },
          ),
        );
      },
    );
  }
}

class Dividers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.black54,);
  }
}

