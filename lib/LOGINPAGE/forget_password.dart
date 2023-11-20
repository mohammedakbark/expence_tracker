import 'dart:ui';

import 'package:flutter/material.dart';

class PageForgetPassword extends StatefulWidget {
  PageForgetPassword({super.key});

  @override
  State<PageForgetPassword> createState() => _PageForgetPasswordState();
}

class _PageForgetPasswordState extends State<PageForgetPassword> {
  final _emailController = TextEditingController();
  bool isbuttonpressed = true;

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
            "Forgot Password",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Center(
                child: Text(
                  "Don't worry.\nEnter your email and we'll\nsend you a link to rest your\npassword",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 25, bottom: 25),
                child: TextFormField(
                  controller: _emailController,
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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
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
              ),
            ],
          ),
        ));
  }
}
