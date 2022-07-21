import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:larix/components/header_input_text.dart';
import 'package:larix/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Background input Color email
  Color _colorEmail = const Color(0xFFBE9CF2);
  Color _hintColorEmail = kHintTextColor2;
  Color _inputColorEmail = kHintTextColor2;

  // Background input Color email
  Color _colorPassword = const Color(0xFFBE9CF2);
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
          _colorEmail = const Color(0xFFBE9CF2);
          _hintColorEmail = kHintTextColor2;
          _inputColorEmail = kHintTextColor2;
        });
      }
    });
    // TODO: implement initState
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
          _colorPassword = const Color(0xFFBE9CF2);
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(93, 12, 224, 1.0),
                Color.fromRGBO(122, 33, 224, 1.0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36,
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Larix',
                        textScaleFactor: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        'THE COMPLETE SOLUTION FOR HUMAN RESOURCES MANAGEMENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(191, 156, 242, 1),
                        Color.fromRGBO(182, 144, 240, 1),
                        Color.fromRGBO(165, 121, 238, 1),
                        Color.fromRGBO(153, 104, 236, 1),
                        Color.fromRGBO(142, 90, 234, 1),
                        Color.fromRGBO(130, 73, 232, 1),
                        Color.fromRGBO(114, 49, 229, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderInputText(
                                inputHeader: "Email or Username",
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  validator: (value) {
                                    EmailValidator.validate(value!)
                                        ? null
                                        : "Please enter a valid email";
                                  },
                                  onChanged: (value) => print(value),
                                  focusNode: _focusNodeEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    color: _inputColorEmail,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _colorEmail,
                                    hintText: "ETCAdmin@etc.info",
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
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const HeaderInputText(
                                inputHeader: "Password",
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter your password";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => print(value),
                                  focusNode: _focusNodePassword,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: _inputColorPassword,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _colorPassword,
                                    hintText: "****************",
                                    hintStyle: TextStyle(
                                      color: _hintColorPassword,
                                      fontSize: 13,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
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
                                    const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color.fromRGBO(220, 220, 248, 1),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'New to larix?',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                220, 220, 248, 1),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/register');
                                          },
                                          child: const Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Center(
                                child: Text(
                                  "Ⓒ  2022 ETC All Right Required",
                                  style: TextStyle(
                                    // color: Color.fromRGBO(180, 142, 220, 1),
                                    color: Color(0xFFD5C7DF),
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
