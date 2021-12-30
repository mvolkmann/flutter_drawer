import 'package:flutter/material.dart';
import 'widget_extensions.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget widget;

  DrawerItem({
    required this.title,
    required this.icon,
    required this.widget,
  });
}

class DrawerScaffold extends StatefulWidget {
  final List<DrawerItem> drawerItems;

  const DrawerScaffold({Key? key, required this.drawerItems}) : super(key: key);

  @override
  State<DrawerScaffold> createState() => _DrawerScaffoldState();
}

class _DrawerScaffoldState extends State<DrawerScaffold> {
  final drawerBgColor = Colors.blue.shade900;
  final drawerFgColor = Colors.white;

  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var listTiles = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var pageItem = widget.drawerItems[i];
      listTiles.add(ListTile(
        leading: Icon(pageItem.icon, color: drawerFgColor).border(),
        //TODO: Why is this so wide?
        title: Text(
          pageItem.title,
          style: TextStyle(color: drawerFgColor),
        ).border(),
        onTap: () {
          setState(() => pageIndex = i);
          Navigator.pop(context);
        },
      ));
    }

    return Scaffold(
      // Scaffolds with an AppBar automatically
      //get a hamburger menu on the left side.
      appBar: AppBar(
        title: Text(widget.drawerItems[pageIndex].title),
      ),
      body: Center(child: widget.drawerItems[pageIndex].widget),
      drawer: Drawer(
        child: Container(
          color: drawerBgColor,
          width: 50,
          child: ListView(
            padding: EdgeInsets.zero, // removes default padding
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Icon(Icons.menu, color: drawerFgColor).align(),
                ),
              ),
              ...listTiles,
            ],
          ),
        ).border(),
      ),
    );
  }
}
