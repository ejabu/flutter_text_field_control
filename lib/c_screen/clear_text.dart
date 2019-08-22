import 'package:flutter/material.dart';

/// This screen demonstrate how to efficiently make API call 
/// after tapping Clear Button in TextField

class ClearTextScreen extends StatefulWidget {
  @override
  _ClearTextScreenState createState() => _ClearTextScreenState();
}

class _ClearTextScreenState extends State<ClearTextScreen> {
  TextEditingController textController = TextEditingController();

  Future callApi(String textToSent) async {
    print("Wait 3 seconds to call server");
    await Future.delayed(Duration(seconds: 3));
    print("Server : $textToSent");
  }

  void clearField() {
    print("c: clearField");
    var newValue = textController.value.copyWith(
      text: '',
      selection: TextSelection.collapsed(offset: 0),
    );
    textController.value = newValue;
    callApi('');
  }

  void changesOnField() {
    print("c: changesOnField");
    String text = textController.text;
    if (text.isNotEmpty) {
      callApi(text);
    }
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(changesOnField);
  }

  @override
  void dispose() {
    textController.dispose(); // release unused memory in RAM
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clear Text Field to API'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Write Something',
              filled: true,
              prefixIcon: Icon(
                Icons.account_box,
                size: 28.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: clearField,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
