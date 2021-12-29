import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        AboutPage.route: (_) => AboutPage(),
        SettingsPage.route: (_) => SettingsPage(),
      },
    );
  }
}

class PageItem {
  final String title;
  final Widget widget;

  PageItem({required this.title, required this.widget});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final pageItems = <PageItem>[
    PageItem(title: 'About', widget: AboutPage()),
    PageItem(title: 'Home', widget: HomePage()),
    PageItem(title: 'Settings', widget: SettingsPage()),
  ];

  var pageIndex = 0;

  Widget page = HomePage();

  @override
  Widget build(BuildContext context) {
    var listTiles = pageItems.map((pageItem) => ListTile(
          title: Text(pageItem.title),
          onTap: () {
            setState(() => page = pageItem.widget);
            Navigator.pop(context);
          },
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(pageItems[pageIndex].title),
      ),
      body: Center(child: page),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // removes default padding
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Why so tall?'),
            ),
            ...listTiles,
          ],
        ),
      ),
    );
  }
}
