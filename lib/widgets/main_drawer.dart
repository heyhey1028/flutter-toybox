import 'package:flutter/material.dart';
import 'package:flutter_toybox/main.dart';
import 'package:flutter_toybox/screens/animation_playground/animation_playground_screen.dart';
import 'package:flutter_toybox/screens/background_play/background_play_screen.dart';
import 'package:flutter_toybox/screens/just_audio/just_audio_screen.dart';
import 'package:flutter_toybox/screens/mark_down/mark_down_screen.dart';
import 'package:flutter_toybox/screens/multiple_audio_play/multiple_audio_screen.dart';
import 'package:flutter_toybox/screens/volume_control/volume_control_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

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
                    backgroundColor: Colors.grey[100]!,
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
              color: Colors.lightBlue[100]!,
              icon: Icon(Icons.home),
              title: 'HOME',
              navigateTo: MyHomePage(),
            ),
            DrawerTile(
              color: Colors.indigo[100]!,
              icon: Icon(Icons.notes),
              title: 'MARK DOWN',
              navigateTo: MarkDownScreen(),
            ),
            DrawerTile(
              color: Colors.red[100]!,
              icon: Icon(Icons.music_note),
              title: 'JUST AUDIO',
              navigateTo: JustAudioScreen(),
            ),
            DrawerTile(
              color: Colors.orange[100]!,
              icon: Icon(Icons.bluetooth_audio_rounded),
              title: 'BACKGROUND PLAY',
              navigateTo: BackgroundPlayScreen(),
            ),
            DrawerTile(
              color: Colors.green[100]!,
              icon: Icon(Icons.volume_up),
              title: 'VOLUME CONTROL',
              navigateTo: VolumeControlScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100]!,
              icon: Icon(Icons.queue_music),
              title: 'MULTIPLE AUDIO',
              navigateTo: MultipleAudioScreen(),
            ),
            DrawerTile(
              color: Colors.yellow[100]!,
              icon: Icon(Icons.animation),
              title: 'ANIMATION PLAYGROUND',
              navigateTo: AnimationPlaygroundScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    this.title,
    this.icon,
    this.color,
    this.navigateTo,
    this.fontFamily,
  });

  final String? title;
  final Icon? icon;
  final Color? color;
  final Widget? navigateTo;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: ListTile(
        leading: icon,
        title: Text(
          title ?? '',
          style: TextStyle(fontFamily: fontFamily),
        ),
        trailing: Icon(Icons.chevron_right_rounded),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => navigateTo ?? MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
