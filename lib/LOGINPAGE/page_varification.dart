import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:tracker/LOGINPAGE/Function.dart';

class PageVarification extends StatefulWidget {
  PageVarification({
    super.key,
  });

  @override
  State<PageVarification> createState() => _PageVarificationState();
}

class _PageVarificationState extends State<PageVarification> {
  bool isbuttonpressed = true;
  final pinController = TextEditingController();

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
            "Verification",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 350,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Enter your\nVerification Code",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 20,
                width: 140,
                child: Pinput(
                    controller: pinController,
                    // obscureText: true,
                    length: 6,
                    cursor: const Text("__")),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  "04:59",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 98, 0, 255),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                    "We send verification code to youre\nemail akbarmohd00123@gmail.com .you can\ncheck your inbox ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 50),
                child: Text("I didn't received the code?Send afain ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 98, 0, 255),
                    )),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      // sendEmailVerification();
                      verifyotp(pinController.text,context);
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
                      "Verify",
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
