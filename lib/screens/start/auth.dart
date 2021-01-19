import 'package:flutter/material.dart';
import 'package:sfero/constants.dart';
import 'package:sfero/globals.dart' as globals;
import 'package:sfero/screens/home/home_screen.dart';

class Auth extends StatefulWidget {
  @override
  _Auth createState() => _Auth();
}

class _Auth extends State<Auth> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        shadowColor: Colors.transparent,
      ),
      body: Builder(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipPath(
              clipper: myCustomClipper(),
              child: Hero(
                tag: 'avatarContainer',
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  child: Card(
                    elevation: 15.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Hero(
                      tag: (globals.avatarState == true)
                          ? 'pavatarHero'
                          : 'davatarHero',
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            (globals.avatarState == true) ? pavatar : davatar,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: kDefaultFontStyle,
                      cursorColor: Colors.purple,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Key word',
                        hintStyle: TextStyle(color: kTextWhiteColor, shadows: [
                          Shadow(
                              blurRadius: 2.0,
                              color: Colors.purple,
                              offset: Offset.fromDirection(-10.0))
                        ]),
                      ),
                      onSubmitted: (value) {
                        if (value == 'и') {
                          globals.userState = true;
                          Navigation(context);
                        } else if (value == 'а') {
                          globals.userState = false;
                          Navigation(context);
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('ты куда звонишь сынок!!'),
                            ),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: TextButton(
                    onPressed: () {
                      if (controller.text == 'cucumber') {
                        globals.userState = true;
                        Navigation(context);
                      }
                      if (controller.text == 'pengven') {
                        globals.userState = false;
                        Navigation(context);
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('ты куда звонишь сынок!!'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Войти",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kTextWhiteColor,
                          shadows: [
                            Shadow(
                                blurRadius: 2.0,
                                color: Colors.purple,
                                offset: Offset.fromDirection(-10.0))
                          ]),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class myCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(0, size.height, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

Function Navigation(context) {
  Navigator.push(
    context,
    PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, animationTime, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInCirc);
          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, animationTime) {
          return HomePage();
        }),
  );
}
