import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:larix/components/header_input_text.dart';
import 'package:larix/screens/login/header.dart';
import 'package:larix/utils/constant.dart';
import 'package:larix/utils/size_config.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  /* -------- Background & input Color username -------- */
  Color _bgColorUsername = kInputColor;
  Color _hintColorUsername = kHintTextColor2;
  Color _inputColorUsername = kHintTextColor2;

  /* -------- Background & input Color email -------- */
  Color _bgColorEmail = kInputColor;
  Color _hintColorEmail = kHintTextColor2;
  Color _inputColorEmail = kHintTextColor2;

  /* -------- Background & input Color password -------- */
  Color _bgColorPassword = kInputColor;
  Color _hintColorPassword = kHintTextColor2;
  Color _inputColorPassword = kHintTextColor2;

  /* -------- Background & input Color confirm_password -------- */
  Color _bgColorConfirmPassword = kInputColor;
  Color _hintColorConfirmPassword = kHintTextColor2;
  Color _inputColorConfirmPassword = kHintTextColor2;

  // Controle State Of The input if pressed or not !!
  final FocusNode _focusNodeUsername = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  /* ------------------------------------------------------- */
  final _formKey = GlobalKey<FormState>();
  /* ------------------------------------------------------- */

  @override
  void dispose() {
    super.dispose();
    _focusNodeUsername.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
  }

  @override
  void initState() {
    super.initState();

    /* -------- manage state of username input -------- */
    _focusNodeUsername.addListener(() {
      if (_focusNodeUsername.hasFocus) {
        setState(() {
          _bgColorUsername = Colors.white;
          _hintColorUsername = kHintTextColor1;
          _inputColorUsername = kHintTextColor1;
        });
      } else {
        setState(() {
          _bgColorUsername = kInputColor;
          _hintColorUsername = kHintTextColor2;
          _inputColorUsername = kHintTextColor2;
        });
      }
    });

    /* -------- manage state of email input -------- */
    _focusNodeEmail.addListener(() {
      if (_focusNodeEmail.hasFocus) {
        setState(() {
          _bgColorEmail = Colors.white;
          _hintColorEmail = kHintTextColor1;
          _inputColorEmail = kHintTextColor1;
        });
      } else {
        setState(() {
          _bgColorEmail = kInputColor;
          _hintColorEmail = kHintTextColor2;
          _inputColorEmail = kHintTextColor2;
        });
      }
    });

    /* -------- manage state of password input -------- */

    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        setState(() {
          _bgColorPassword = Colors.white;
          _hintColorPassword = kHintTextColor1;
          _inputColorPassword = kHintTextColor1;
        });
      } else {
        setState(() {
          _bgColorPassword = kInputColor;
          _hintColorPassword = kHintTextColor2;
          _inputColorPassword = kHintTextColor2;
        });
      }
    });

    /* -------- manage state of password input  -------- */

    _focusNodeConfirmPassword.addListener(() {
      if (_focusNodeConfirmPassword.hasFocus) {
        setState(() {
          _bgColorConfirmPassword = Colors.white;
          _hintColorConfirmPassword = kHintTextColor1;
          _inputColorConfirmPassword = kHintTextColor1;
        });
      } else {
        setState(() {
          _bgColorConfirmPassword = kInputColor;
          _hintColorConfirmPassword = kHintTextColor2;
          _inputColorConfirmPassword = kHintTextColor2;
        });
      }
    });
  }

  /* --------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_larix.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 3,
                child: Header(),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: kCardDrawerColor, width: 1.5),
                    color: kPrimaryColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 8, top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to Larix!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                          // textScaleFactor: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderInputText(
                                inputHeader: "Name*",
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    "Please enter a valid username";
                                  }
                                  return null;
                                },
                                // ignore: avoid_print
                                onChanged: (value) => print(value),
                                focusNode: _focusNodeUsername,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                  color: _inputColorUsername,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  fillColor: _bgColorUsername,
                                  hintText: "username",
                                  hintStyle: TextStyle(
                                    color: _hintColorUsername,
                                    fontSize: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const HeaderInputText(
                                inputHeader: "Email*",
                              ),
                              TextFormField(
                                validator: (value) {
                                  EmailValidator.validate(value!)
                                      ? null
                                      : "Please enter a valid email";
                                  return null;
                                },
                                // ignore: avoid_print
                                onChanged: (value) => print(value),
                                focusNode: _focusNodeEmail,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: _inputColorEmail,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  fillColor: _bgColorEmail,
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(
                                    color: _hintColorEmail,
                                    fontSize: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const HeaderInputText(
                                inputHeader: "Password",
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter a valid password";
                                  }
                                  return null;
                                },
                                // ignore: avoid_print
                                onChanged: (value) => print(value),
                                focusNode: _focusNodePassword,
                                obscureText: true,
                                obscuringCharacter: '*',
                                style: TextStyle(
                                  color: _inputColorPassword,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  fillColor: _bgColorPassword,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: _hintColorPassword,
                                    fontSize: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const HeaderInputText(
                                  inputHeader: "Confirm Password"),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter a valid password";
                                  }
                                  return null;
                                },
                                // ignore: avoid_print
                                onChanged: (value) => print(value),
                                focusNode: _focusNodeConfirmPassword,
                                obscureText: true,
                                expands: false,
                                obscuringCharacter: '*',
                                style: TextStyle(
                                  color: _inputColorConfirmPassword,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  fillColor: _bgColorConfirmPassword,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: _hintColorConfirmPassword,
                                    fontSize: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {}
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromRGBO(93, 62, 237, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already Have an account?",
                                      style: TextStyle(
                                        color: kHintTextColor2.withOpacity(0.9),
                                        fontFamily: "Poppins",
                                      ),
                                      textScaleFactor: 0.9,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.pushReplacementNamed(
                                        //     context, '/login');

                                        Get.offAndToNamed('/login');
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  "Ⓒ  2022 ETC All Right Required",
                                  style: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textScaleFactor: 0.8,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
