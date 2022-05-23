import 'package:chatmate/screens/login_screen.dart';
import 'package:chatmate/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

   late AnimationController controller;
   late Animation animation;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey.shade400, end: Colors.white).animate(controller);


    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
     controller.dispose();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                    style: const TextStyle(fontSize: 40,color: Colors.blueGrey),
                    child: AnimatedTextKit(
                      animatedTexts: [WavyAnimatedText('ChatMate')],
                      isRepeatingAnimation: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'login',colour: Colors.lightBlueAccent,onPressed: LoginScreen.id),
            RoundedButton(title: 'Registration',colour: Colors.blueAccent, onPressed: RegistrationScreen.id),
          ],
        ),
      ),
    );
  }
}
