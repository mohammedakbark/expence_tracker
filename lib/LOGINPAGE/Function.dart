// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, non_constant_identifier_names, avoid_single_cascade_in_expression_statements

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pinput.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/LOGINPAGE/page_varification.dart';
import 'package:tracker/PAGES/page_home.dart';
import 'package:tracker/SPLASHSCREEN/spalshscreen.dart';

final Controller inset = Controller();
void sign(String email, password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageVarification()));
    });
  } catch (e) {
    _showDiolog(e.toString(), context);
  }
  // on FirebaseAuthException catch (e) {
  //   if (e.code == 'weak-password') {
  //      _showDiolog('The password provided is too weak.', context);
  //     print('The password provided is too weak.');
  //   } else if (e.code == 'email-already-in-use') {
  //      _showDiolog('The account already exists for that email.', context);
  //     // print('The account already exists for that email.');
  //   }
  // } catch (e) {
  //   _showDiolog("/////////////////////////////", context);
  // }
}

void login(String email, password, context) async {
  // try {
  //   final credential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((_) {
  //     // Navigator.push(context,
  //     //     MaterialPageRoute(builder: ((context) => HomePage(inset: inset))));
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomePage(inset: inset)),
  //         (route) => false);
  //   });
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'user-not-found') {
  //    _showDiolog("No user found for that email", context);
  //     print('No user found for that email.');
  //   } else if (e.code == 'wrong-password') {
  //     _showDiolog(e.toString(), context);
  //     print('Wrong password provided for that user.');
  //   }
  // }
  //OR
  try {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password);
   
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
 FirebaseAuth.instance.signInWithCredential(credential).then((_) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage(inset: inset)),
              (route) => false);
        },
      );
  } catch (e) {
    print(""""""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """object"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """""");
    _showDiolog(e.toString(), context);
  }
}

void sendEmailVerification() async {
  try {
    // User? user = FirebaseAuth.instance.currentUser;
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      
      await user.sendEmailVerification();
      print('Verification email sent to ${user.email}');
    } else {
      print('Email is already verified or user is not signed in.');
    }
  } catch (e) {
    print('Error sending verification email: $e');
  }
}

EmailOTP myauth = EmailOTP();
void configaration(String email) {
  myauth.setConfig(
      appEmail: "me@rohitchouhan.com",
      appName: "Email OTP",
      userEmail: email,
      otpLength: 6,
      otpType: OTPType.digitsOnly);
}

void sendotp() {
  myauth.sendOTP();
}

void verifyotp(String otp, context) {
  bool ver = myauth.verifyOTP(otp: otp);
  if (ver) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomePage(inset: inset)));
  }
}

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//   'email'
//   // "http://www.googleapis.com/auth/contacts.readonly"
// ]);
// late GoogleSignInAccount _currentuser;
// void initSignOrNot() {
//   _googleSignIn.onCurrentUserChanged.listen((account) {
//     // setState(() {
//     _currentuser = account!;
//     // });
//     if (_currentuser != null) {
//       print("user is already auth");
//     }
//   });
//   _googleSignIn.signInSilently();
// }
// Future<void> handleSignin(context) async {
//   try {
//     print("/////////////////////////////////////////////");
//     await _googleSignIn.signIn().then((value) => Navigator.push(
//         context, MaterialPageRoute(builder: (context) => HomePage(inset: inset,))));
//   } catch (e) {
//     print("sign error:" + e.toString());
//   }
// }
signWithGoogle(context) async {
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? gAuth = await gUser!.authentication;
  final Credential = GoogleAuthProvider.credential(
      accessToken: gAuth!.accessToken, idToken: gAuth.idToken);
  return await FirebaseAuth.instance.signInWithCredential(Credential).then(
      (value) => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage(inset: inset))));
}

///////////////////////////////////
void signoutFromGoogle(context) {
  final ggggg = GoogleSignIn();
  ggggg.signOut().then((value) => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => Splashscreen(inset: inset))));
}

void signOutFromMAil(context) {
  FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splashscreen(inset: inset))));
}

// showerroemessage(String content, context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(content),
//       duration: Duration(seconds: 3),
//       action: SnackBarAction(
//         label: 'Dismiss',
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//     ),
//   );
//   ;
// }
_showDiolog(String title, context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Text("$title"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"))
      ],
    ),
  );
}
