import 'package:flutter/material.dart';
import 'package:flutter_toybox/main.dart';
import 'package:flutter_toybox/screens/mark_down/mark_down_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    foregroundImage:
                        AssetImage('assets/images/flutter_logo.png'),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('FLUTTER TOY BOX'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100],
              icon: Icon(Icons.home),
              title: 'HOME',
              navigateTo: MyHomePage(),
            ),
            DrawerTile(
              color: Colors.indigo[100],
              icon: Icon(Icons.notes),
              title: 'MARK DOWN',
              navigateTo: MarkDownScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100],
              icon: Icon(Icons.group),
              title: 'FLUTTER SHARE',
              navigateTo: MyHomePage(),
            ),
            DrawerTile(
              color: Colors.yellow[100],
              icon: Icon(Icons.animation),
              title: 'ANIMATION PLAYGROUND',
              navigateTo: null,
            ),
            DrawerTile(
              color: Colors.orange[100],
              icon: Icon(Icons.widgets),
              title: 'ICON MADNESS',
              navigateTo: null,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key key,
    this.title,
    this.icon,
    this.color,
    this.navigateTo,
    this.fontFamily,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final Color color;
  final Widget navigateTo;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(fontFamily: fontFamily),
        ),
        trailing: Icon(Icons.chevron_right_rounded),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => navigateTo,
            ),
          );
        },
      ),
    );
  }
}
