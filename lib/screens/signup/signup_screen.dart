import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larix/components/divider_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideRPassword = true;
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
              image: AssetImage(
                'assets/images/bg-register.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'larix',
                        textScaleFactor: 2.5,
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
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 18,
                          ),
                          textScaleFactor: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 52,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a valid username !";
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: const Text("Username"),
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 52,
                                child: TextFormField(
                                  validator: (value) =>
                                      EmailValidator.validate(value!)
                                          ? null
                                          : "Please enter a valid email",
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: const Text("Email"),
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 52,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter your password";
                                    }
                                    return null;
                                  },
                                  obscureText: _hidePassword,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: const Text("Password"),
                                    prefixIcon: const Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hidePassword = !_hidePassword;
                                        });
                                      },
                                    ),
                                    focusColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 52,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter your password";
                                    }
                                    return null;
                                  },
                                  obscureText: _hideRPassword,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: const Text("Confirm Password"),
                                    // hintText: "confirm password",
                                    prefixIcon: const Icon(Icons.lock_open),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _hideRPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hideRPassword = !_hideRPassword;
                                        });
                                      },
                                    ),
                                    focusColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {}
                                    // Navigator.pushReplacementNamed(
                                    //     context, '/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromRGBO(93, 62, 237, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Already Have an account?',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                220, 200, 248, 1),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/login');
                                          },
                                          child: const Text(
                                            'Sign In',
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
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              const DividerBar(),
                              const SizedBox(
                                height: 10,
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  minimumSize: const Size(double.infinity, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                icon: const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'Sign Up with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Ⓒ 2022 ETC All Right Required",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                                textScaleFactor: 0.8,
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideRPassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              fontSize: 18,
            ),
            textScaleFactor: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a valid username !";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black87,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Username"),
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black87,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Email"),
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your password";
                      }
                      return null;
                    },
                    obscureText: _hidePassword,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Password"),
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 52,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your password";
                      }
                      return null;
                    },
                    obscureText: _hideRPassword,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text("Confirm Password"),
                      // hintText: "confirm password",
                      prefixIcon: const Icon(Icons.lock_open),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hideRPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _hideRPassword = !_hideRPassword;
                          });
                        },
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {}
                      // Navigator.pushReplacementNamed(
                      //     context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(93, 62, 237, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
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
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Already Have an account?',
                            style: TextStyle(
                              color: Color.fromRGBO(220, 200, 248, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: const Text(
                              'Sign In',
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
                // const SizedBox(
                //   height: 10,
                // ),
                const DividerBar(),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Sign Up with Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Ⓒ 2022 ETC All Right Required",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 0.8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
