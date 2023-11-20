import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/LOGINPAGE/pageSignOrLogin.dart';
import 'package:tracker/PAGES/page_home.dart';
import 'package:tracker/PROVIDER/expence_provider.dart';
import 'package:tracker/PROVIDER/home_provider.dart';
import 'package:tracker/PROVIDER/income_provider.dart';
import 'package:tracker/SPLASHSCREEN/spalshscreen.dart';
import 'package:tracker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Controller inset = Controller();

    // TransactionModel obj =TransactionModel();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<incomeprovider>(create: (_) => incomeprovider()),
        ChangeNotifierProvider<expenceprovider>(
            create: (_) => expenceprovider()),
        // ChangeNotifierProvider<listprovider>(create: (_) => listprovider())
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        //  ChangeNotifierProvider<Controller>(create: (_) =>Controller()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return HomePage(inset: inset);
                } else {
                  return SignOrLogin();
                }
              })),
      // home: HomePage(inset: inset)
      // ),
    );
  }
}
