import 'package:flutter/material.dart';

class TextFieldRoute extends StatefulWidget {
  @override
  _TextFieldRouteState createState() => _TextFieldRouteState();
}

class _TextFieldRouteState extends State<TextFieldRoute> {
  ScrollController _scrollController;
  TextEditingController _textEditingController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bug'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _textEditingController
                          ..text = ''
                          ..selection = TextSelection.collapsed(
                              offset: _textEditingController.text.length);
                      },
                      child: Text('Set \'\' empty value'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _textEditingController.text = '1234567890';
                      },
                      child: Text('Set \'1234567890\' value'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _textEditingController.text = '';
                      },
                      child: Text('Clear text field'),
                    ),
                    Container(
                      height: 450,
                      child: Center(
                        child: Text(
                          'JUST AN EMPTY SPACE PLACEHOLDER',
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      child: Center(
                        child: Text(
                          'SCROLL DOWN TO SEE THE TEXT FIELD',
                        ),
                      ),
                    ),
                    TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(labelText: 'Experimet field'),
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.jumpTo(0);
        },
        tooltip: 'Scroll to top',
        child: Icon(Icons.keyboard_arrow_up),
      ),
    );
  }
}
