import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'home_page.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 20.0),
                child: Container(
                  child: Text("TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 25)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                  endRadius: 140,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 1),
                  startDelay: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      child: Container(
                        child: Image.asset(
                          'assets/tictactoelogo.png',
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      radius: 80.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 20.0),
                child: Container(
                  child: Text("@CREATEDBY M.ADNAN",
                      style: myNewFontWhite.copyWith(fontSize: 15)),
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'PLAY GAME',
                        style: myNewFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
