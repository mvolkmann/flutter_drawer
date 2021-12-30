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

  final Color? bgColor;
  final Color? fgColor;
  final double width;

  DrawerScaffold({
    Key? key,
    required this.drawerItems,
    this.bgColor,
    this.fgColor,
    this.width = 140,
  }) : super(key: key);

  @override
  State<DrawerScaffold> createState() => _DrawerScaffoldState();
}

class _DrawerScaffoldState extends State<DrawerScaffold> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var drawerBgColor = widget.bgColor ?? Colors.blue.shade700;
    var drawerFgColor = widget.fgColor ?? Colors.white;

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
      // get a hamburger menu on the left side.
      appBar: AppBar(
        title: Text(widget.drawerItems[pageIndex].title),
      ),
      body: Center(child: widget.drawerItems[pageIndex].widget),
      drawer: SizedBox(
        width: widget.width,
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
                  ).align(),
                  padding: EdgeInsets.zero, // removes default padding
                  // This size lines up the two hamburger icons perfectly.
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
