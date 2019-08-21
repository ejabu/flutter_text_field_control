import 'package:flutter/material.dart';

class ButtonAddScreen extends StatelessWidget {
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

//I have this as a global variable
TextEditingController _searchInputControllor = TextEditingController();

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

//This is the TextField
class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _searchInputControllor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        border: InputBorder.none,
        hintText: "Search...",
        suffixIcon: Material(
          color: Colors.white,
          elevation: 6.0,
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          child: InkWell(
            splashColor: Colors.greenAccent,
            onTap: () {},
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

class SpecialChar extends StatefulWidget {
  final String btnVal;

  SpecialChar({
    this.btnVal,
  });
  @override
  _SpecialCharState createState() => _SpecialCharState();
}

//This is the button widget
//It is supposed to add to the search bar but nothing happens
class _SpecialCharState extends State<SpecialChar> {
  void appendCharacters() {
    String oldText = _searchInputControllor.text;
    String newText = oldText + widget.btnVal.toLowerCase();

    var newValue = _searchInputControllor.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
      composing: TextRange.empty,
    );

    _searchInputControllor.value = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 40.0,
      child: FlatButton(
        color: Colors.transparent,
        textColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blue,
        onPressed: appendCharacters,
        child: Text(widget.btnVal),
      ),
    );
  }
}
