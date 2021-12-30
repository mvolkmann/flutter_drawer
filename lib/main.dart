import 'package:flutter/material.dart';
import 'about_page.dart';
import 'drawer_scaffold.dart';
import 'home_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final drawerItems = <DrawerItem>[
    DrawerItem(title: 'About', widget: AboutPage()),
    DrawerItem(title: 'Home', widget: HomePage()),
    DrawerItem(title: 'Settings', widget: SettingsPage()),
  ];

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DrawerScaffold(drawerItems: drawerItems),
    );
  }
}
