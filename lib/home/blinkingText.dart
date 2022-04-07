import 'dart:async';

import 'package:flutter/material.dart';

class BlinkingText extends StatefulWidget {
  final String _target;
  BlinkingText(this._target);
  @override
  BlinkingTextState createState() => BlinkingTextState();
}

class BlinkingTextState extends State<BlinkingText> {
  bool _show = true;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 700), (_) {
      setState(() => _show = !_show);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(widget._target,
      style: _show
          ? TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white)
          : TextStyle(color: Colors.transparent));

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}