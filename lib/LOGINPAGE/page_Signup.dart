import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracker/LOGINPAGE/Function.dart';
import 'package:tracker/LOGINPAGE/mobilenumber.dart';
import 'package:tracker/LOGINPAGE/mobileverification.dart';
import 'package:tracker/LOGINPAGE/page_Login.dart';
import 'package:tracker/LOGINPAGE/page_varification.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'email'
  // "http://www.googleapis.com/auth/contacts.readonly"
]);
late GoogleSignInAccount _currentuser;

class PageSignUp extends StatefulWidget {
  PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  // final _nameController = TextEditingController();

  // final _emailController = TextEditingController();

  // final _passwordController = TextEditingController();
  String? _passwordController;
  String? _emailController;
  String? _nameController;

  bool _checkboxValue = false;
  bool isbuttonpressed = true;
  final _formkey = GlobalKey<FormState>();
  // void sendSignUpEmailLink(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.sendSignInLinkToEmail(
  //       email: _emailController!,
  //       actionCodeSettings: ActionCodeSettings(
  //         url:
  //             "localhost.com", // Replace with your dynamic link domain
  //         handleCodeInApp: true,
  //         androidPackageName:
  //             "com.example.tracker", // Replace with your Android package name
  //          // Replace with your iOS bundle ID
  //         androidInstallApp: true,
  //         androidMinimumVersion: "12",
  //       ),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Sign-up link sent to $_emailController"),
  //       ),
  //     );
  //   } catch (e) {
  //     print("Error sending email link: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Error sending sign-up link"),
  //       ),
  //     );
  //   }
  // }
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      _googleSignIn.onCurrentUserChanged.listen((account) {
//     setState(() {
//     _currentuser = account!;
//     });
//     if (_currentuser != null) {
//       print("user is already auth");
//     }
//   });
//   _googleSignIn.signInSilently();
//   }

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
            "Sign Up",
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
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    key: ValueKey("Username"),
                    validator: (value) {
                      if (value.toString().length < 3) {
                        return "User name is small";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _nameController = value;
                      });
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: "  Name",
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
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 25, bottom: 25),
                  child: TextFormField(
                    key: ValueKey("Email"),
                    validator: (value) {
                      if (!(value.toString().contains("@"))) {
                        return "Email is not correct";
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
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    obscureText: isbuttonpressed,
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
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 25, bottom: 25),
                      child: Checkbox(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 84, 35, 244),
                              width: 2),
                          fillColor:
                              const MaterialStatePropertyAll(Colors.white),
                          checkColor: const Color.fromARGB(255, 84, 35, 244),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: _checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              _checkboxValue = !_checkboxValue;
                            });
                          }),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "By signing up,you agree to the",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Teams of  Service and Privacy Policy",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 84, 35, 244),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        // sign(_emailController!, _passwordController, context);
                        sendEmailVerification();
                        // configaration(_emailController!);
                        // sendotp();

                        // sendSignUpEmail@gmail.comLink(context);
                      }
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            left: 150, right: 150, top: 20, bottom: 20)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 96, 11, 255),
                        )),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 22),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Or with",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 25, bottom: 25),
                  child: ElevatedButton(
                      onPressed: () {
                        // if(_formkey.currentState!.validate())
                        signWithGoogle(context);
                        // handleSignin(context);
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          side: MaterialStatePropertyAll(BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 209, 209, 209))),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(top: 20, bottom: 20)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 255, 255),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/google.png"),
                          const Text(
                            "  Sign Up with Google",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ],
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => mobilenumber()));
                    },
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            left: 50, right: 50, top: 20, bottom: 20)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 0, 0, 0),
                        )),
                    child: const Text(
                      "Sign Up with Phone Number",
                      style: TextStyle(fontSize: 22),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Already have an account?",
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
                                builder: (context) => PageLogin()));
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color.fromARGB(255, 161, 56, 236),
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
