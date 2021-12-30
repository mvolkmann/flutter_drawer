import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final Widget widget;

  DrawerItem({required this.title, required this.widget});
}

class DrawerScaffold extends StatefulWidget {
  final List<DrawerItem> drawerItems;

  const DrawerScaffold({Key? key, required this.drawerItems}) : super(key: key);

  @override
  State<DrawerScaffold> createState() => _DrawerScaffoldState();
}

class _DrawerScaffoldState extends State<DrawerScaffold> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var listTiles = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var pageItem = widget.drawerItems[i];
      listTiles.add(ListTile(
        title: Text(pageItem.title),
        onTap: () {
          setState(() => pageIndex = i);
          Navigator.pop(context);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItems[pageIndex].title),
      ),
      body: Center(child: widget.drawerItems[pageIndex].widget),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // removes default padding
          children: [
            DrawerHeader(
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
