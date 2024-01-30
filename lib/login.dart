import 'package:flutter/material.dart';
import 'package:notes_app/home.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFf1e8c2),
      body: Column(
        children: [
          Container(
            width: maxWidth,
            height: maxHeight * 0.45,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: maxWidth,
            height: maxHeight * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Text(
                  'Lets sign you in.',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 20,),
                const Text(
                  "Sign in with your data that you have entered during your registration.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.person,
                          size: 30,
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        controller: usernameController,
                        focusNode: usernameFocusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Username',
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 50, height: 50, child: Icon(Icons.lock)),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: _isObscure,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelText: 'Password',
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.065,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)), backgroundColor: Colors.brown),
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const HomePage()));
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont Have an account?",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            print('test');
                          });
                        },
                        child: const Text(
                          " Register",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
