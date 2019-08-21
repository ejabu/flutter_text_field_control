import 'package:flutter/material.dart';

class AutoCallApi extends StatefulWidget {
  @override
  _AutoCallApiState createState() => _AutoCallApiState();
}

class _AutoCallApiState extends State<AutoCallApi> {
  TextEditingController codigoController = TextEditingController();

  Future callApi(String textToSent) async {
    print("Wait 3 seconds to call server");
    await Future.delayed(Duration(seconds: 3));
    print("Saved data to API");
    codigoController.clear();
  }

  void changesOnField() {
    String text = codigoController.text;
    if (text.isNotEmpty) {
      print("changed : $text");
      if (text.contains('\n')) {
        print("\\n is detected");
        callApi(text);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    codigoController.addListener(changesOnField);
  }

  @override
  void dispose() {
    codigoController.dispose(); // release unused memory in RAM
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Call Api'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            maxLines: null,
            controller: codigoController,
            autofocus: true,
          ),
        ),
      ),
    );
  }
}
