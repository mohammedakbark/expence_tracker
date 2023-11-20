import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tracker/LOGINPAGE/Function.dart';
import 'package:tracker/LOGINPAGE/forget_password.dart';
import 'package:tracker/LOGINPAGE/page_Signup.dart';

class PageLogin extends StatefulWidget {
  PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  String? _passwordController;
  String? _emailController;
  bool isbuttonpressed = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 25),
                  child: TextFormField(
                    key: ValueKey("mail"),
                    validator: (value) {
                      if (!(value.toString().contains("@"))) {
                        return "email is not correct";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _emailController = value;
                      });
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "  Email",
                      hintStyle: TextStyle(
                        fontSize: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    key: ValueKey("Password"),
                    validator: (value) {
                      if ((value.toString().length < 6)) {
                        return "Password is Short";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _passwordController = value;
                      });
                    },
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "  Password",
                        hintStyle: const TextStyle(
                          fontSize: 24,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: TextButton(
                          child: isbuttonpressed
                              ? Image.asset(
                                  "assets/hide.png",
                                  scale: 23,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            setState(() {
                              isbuttonpressed = !isbuttonpressed;
                            });
                          },
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        login(_emailController!, _passwordController, context);
                      }
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            left: 150, right: 150, top: 20, bottom: 20)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 98, 0, 255),
                        )),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageForgetPassword()));
                  },
                  child: const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 98, 0, 255),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Don't have an account yet?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageSignUp()));
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.combine([
                            TextDecoration.underline,
                          ]),
                          fontSize: 18,
                          color: const Color.fromARGB(255, 98, 0, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
