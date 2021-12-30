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
        leading: Icon(pageItem.icon, color: drawerFgColor),
        minLeadingWidth: 10, // decreases space between leading and title
        title: Text(
          pageItem.title,
          style: TextStyle(color: drawerFgColor),
        ),
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
      drawer: SizedBox(
        width: 140,
        child: Drawer(
          child: Container(
            color: drawerBgColor,
            child: ListView(
              padding: EdgeInsets.zero, // removes default padding
              children: [
                DrawerHeader(
                  child: IconButton(
                    color: drawerFgColor,
                    icon: Icon(Icons.menu),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero, // removes default padding
                  ).align().border(),
                ).size(width: 0, height: 110),
                ...listTiles,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
