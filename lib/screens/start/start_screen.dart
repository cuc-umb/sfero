import 'package:flutter/material.dart';
import 'package:sfero/constants.dart';
import 'package:sfero/screens/start/auth.dart';
import 'package:sfero/globals.dart' as globals;

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Hero(
          tag: 'avatarContainer',
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[100],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kDefaultPaddin),
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: avatarCard(context, pavatar, 'pavatarHero', true),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: avatarCard(context, davatar, 'davatarHero', false),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

Widget avatarCard(context, avatar, avatarTag, avatarState) {
  return GestureDetector(
    child: Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 15.0,
        child: Hero(
          tag: avatarTag,
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: avatar,
          ),
        ),
      ),
    ),
    onTap: () {
      globals.avatarState = (avatarState) ? true : false;
      if (avatarTag == 'pavatarHero') {
        globals.avatarState = true;
        print(globals.avatarState);
      } else if (avatarTag == 'davatarHero') {
        globals.avatarState = false;
        print(globals.avatarState);
      }
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              pageBuilder: (context, a, b) => Auth()));
    },
  );
}
