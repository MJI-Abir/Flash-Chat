import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/core/utils/routes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController logoAnimationController, screenAnimationController;
  late Animation logoAnimation, screenAnimation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenAnimation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: logoAnimation.value * 80,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            AuthButton(
              context: context,
              id: 'Log In',
              color: Colors.lightBlueAccent,
              onPress: () {
                Navigator.pushNamed(context, Routes.loginScreen);
              },
            ),
            AuthButton(
              context: context,
              id: 'Register',
              color: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, Routes.registrationScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    logoAnimationController.dispose();
    screenAnimationController.dispose();
  }

  void animate() {
    logoAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    screenAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    logoAnimation = CurvedAnimation(
        parent: logoAnimationController, curve: Curves.decelerate);

    screenAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(screenAnimationController);

    logoAnimationController.addListener(() {
      setState(() {});
    });
    screenAnimationController.addListener(() {
      setState(() {});
    });
    logoAnimationController.forward();
    screenAnimationController.forward();
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.context,
    required this.id,
    required this.color,
    required this.onPress,
  });

  final BuildContext context;
  final String id;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            id,
          ),
        ),
      ),
    );
  }
}
