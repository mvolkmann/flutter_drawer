import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('This is the Home page.');
  }
}
