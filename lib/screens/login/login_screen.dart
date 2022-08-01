import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larix/components/header_input_text.dart';
import 'package:larix/screens/login/header.dart';
import 'package:larix/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Background input Color email
  Color _colorEmail = kInputColor;
  Color _hintColorEmail = kHintTextColor2;
  Color _inputColorEmail = kHintTextColor2;

  // Background input Color password
  Color _colorPassword = kInputColor;
  Color _hintColorPassword = kHintTextColor2;
  Color _inputColorPassword = kHintTextColor2;

  // Controle State Of The input if pressed or not !!
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  // bool _hidePassword = true;

  @override
  void initState() {
    _focusNodeEmail.addListener(() {
      if (_focusNodeEmail.hasFocus) {
        setState(() {
          _colorEmail = Colors.white;
          _hintColorEmail = kHintTextColor1;
          _inputColorEmail = kHintTextColor1;
        });
      } else {
        setState(() {
          _colorEmail = kInputColor;
          _hintColorEmail = kHintTextColor2;
          _inputColorEmail = kHintTextColor2;
        });
      }
    });

    super.initState();

    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        setState(() {
          _colorPassword = Colors.white;
          _hintColorPassword = kHintTextColor1;
          _inputColorPassword = kHintTextColor1;
        });
      } else {
        setState(() {
          _colorPassword = kInputColor;
          _hintColorPassword = kHintTextColor2;
          _inputColorPassword = kHintTextColor2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                flex: 10,
                child: Container(
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
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome Back !",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Sf-Pro",
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderInputText(
                                inputHeader: "Email or Username",
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid email";
                                  }
                                  EmailValidator.validate(value)
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
                                  fontSize: 13,
                                ),

                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _colorEmail,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: _hintColorEmail,
                                    fontSize: 12,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const HeaderInputText(
                                inputHeader: "Password",
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter your password";
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
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  filled: true,
                                  fillColor: _colorPassword,
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
                                height: 40,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed('/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF5138EE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      )),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: kHintTextColor2.withOpacity(0.9),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'New to larix?',
                                          style: TextStyle(
                                            color: kHintTextColor2
                                                .withOpacity(0.9),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.pushReplacementNamed(
                                            //     context, '/register');
                                            Get.toNamed('/register');
                                          },
                                          child: const Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              const Center(
                                child: Text(
                                  "Ⓒ  2022 ETC All Right Required",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textScaleFactor: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
