import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/utils/constants.dart';
import 'package:flash_chat/core/utils/routes.dart';
import 'package:flash_chat/core/widgets/customized_button.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              CustomizedButton(
                context: context,
                id: 'Log In',
                color: Colors.lightBlueAccent,
                onPress: () async {
                  setState(
                    () {
                      showSpinner = true;
                    },
                  );
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // ignore: use_build_context_synchronously
                    if (user != null) {
                      Navigator.pushNamed(context, Routes.chatScreen);
                    }
                  } catch (e) {
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      dismissDirection: DismissDirection.startToEnd,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      content: AwesomeSnackbarContent(
                          title: 'LOGIN FAILED',
                          message: e.toString(),
                          contentType: ContentType.failure),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                  setState(
                    () {
                      showSpinner = false;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
