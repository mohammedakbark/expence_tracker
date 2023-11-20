// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tracker/CLASS/bottombar.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/LOGINPAGE/Function.dart';
import 'package:tracker/PAGES/page_expence.dart';
import 'package:tracker/PAGES/page_income.dart';
import 'package:tracker/PAGES/transition.dart';
import 'package:tracker/PROVIDER/home_provider.dart';

import '../class/element.dart';
import '../class/graph.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//   'email'
//   // "http://www.googleapis.com/auth/contacts.readonly"
// ]);

class HomePage extends StatefulWidget {
  final Controller inset;

  HomePage({
    super.key,
    required this.inset,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFABs = false;

  List<String> dropDownList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    " August",
    " September",
    "October",
    "November",
    "December"
  ];
  void initState() {
    savedDataPrefer();
    // gotonxtPG();
    super.initState();
  }

  void savedDataPrefer() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      widget.inset.mainbalance = prefer.getInt("BA") ?? 0;
      widget.inset.mainincome = prefer.getInt("IN") ?? 0;
      widget.inset.mainexpence = prefer.getInt("EX") ?? 0;
      // widget.obj.Category = prefer.getString("CAT")??"";
      // widget.obj.Description = prefer.getString("DES")??"";
      // widget.obj.Time = prefer.getString("TI")??"";
      // widget.obj.amount = prefer.getString("AMO")??"";
    });
  }

  @override
  Widget build(BuildContext context) {
    // final insett = Provider.of<Controller>(context, listen: true);

    // final homePageState = Provider.of<HomeProvider>(context,);
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    //   homePageState.savedDataPrefer();
    // });
    // Provider.of<HomeProvider>(context, listen: true);
    // void savedDataPrefer() async {
    //   SharedPreferences prefer = await SharedPreferences.getInstance();

    //   inset.mainbalance = prefer.getInt("BA") ?? 0;
    //   inset.mainincome = prefer.getInt("IN") ?? 0;
    //   inset.mainexpence = prefer.getInt("EX") ?? 0;
    //   // widget.obj.Category = prefer.getString("CAT")??"";
    //   // widget.obj.Description = prefer.getString("DES")??"";
    //   // widget.obj.Time = prefer.getString("TI")??"";
    //   // widget.obj.amount = prefer.getString("AMO")??"";

    // }

    return Consumer<HomeProvider>(builder: (context, homepro, child) {
      return SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(
                        "assets/user.jpg",
                      )),
                ),
                title: DropdownButton(
                  alignment: Alignment.center,
                  hint: Text("SELECT MONTH"),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  elevation: 0,
                  // icon: Icon(Icons.keyboard_arrow_down_outlined),
                  value: homepro.selectedItem,
                  onChanged: (newValue) {
                    homepro.selecteditem(newValue);
                    //or
                    // homepro.selectedItem = newValue;
                    // setState(() {
                    //   selectedItem = newValue;
                    // });
                  },
                  items: dropDownList.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          signoutFromGoogle(context);
                          signOutFromMAil(context);
                        },
                        child: Icon(
                          Icons.notifications_rounded,
                          color: Color.fromARGB(255, 111, 0, 255),
                          size: 32,
                        ),
                      ))
                ],
              ),
              body: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              Color.fromARGB(255, 247, 223, 187),
                              Color.fromARGB(255, 255, 251, 245),
                            ])),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Text(
                            "Account Balance",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            "${widget.inset.mainbalance}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(28, 28)),
                                  color: Colors.green,
                                ),
                                width: 164,
                                height: 80,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(14, 14)),
                                        child: ColoredBox(
                                          color: Colors.white,
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                                "assets/income.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 78, top: 18),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 7),
                                              child: Text(
                                                "Income",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "${widget.inset.mainincome}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  letterSpacing: 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(28, 28)),
                                  color: Colors.red,
                                ),
                                width: 164,
                                height: 80,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(14, 14)),
                                        child: ColoredBox(
                                          color: Colors.white,
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                                "assets/expense.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 78, top: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 7),
                                            child: Text(
                                              "Expense",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${widget.inset.mainexpence}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                letterSpacing: 1),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 280),
                    child: MyGraph(inset: widget.inset),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 550),
                    child: Elementss(inset: widget.inset
                        // isVisibleValue: _isButtonPressed,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 500, left: 20),
                    child: Visibility(
                      visible: homepro.isButtonPressed,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 100),
                            child: FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IncomePge(
                                              // obj: widget.obj,
                                              inset: widget.inset,
                                            )));
                                // Add your logic for the first FAB here
                              },
                              child: Image.asset(
                                "assets/income.png",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150, top: 50),
                            child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TransferPge()));
                                  // Add your logic for the second FAB here
                                },
                                child: Image.asset(
                                    "assets/currency exchange.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220, top: 100),
                            child: FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExpencePage(
                                              // obj: widget.obj,
                                              inset: widget.inset,
                                            )));
                                // Add your logic for the third FAB here
                              },
                              child: Image.asset(
                                "assets/expense.png",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: MyNavBar(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: SizedBox(
                height: 72,
                width: 72,
                child: FittedBox(
                  child: FloatingActionButton(
                    child: homepro.isButtonPressed
                        ? Image.asset(
                            'assets/cross.png',
                            color: const Color.fromARGB(255, 255, 255, 255),
                          )
                        : Image.asset(
                            'assets/close.png',
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                    backgroundColor: Color.fromARGB(255, 89, 0, 223),
                    onPressed: () {
                      homepro.isbuttonpressed();
                      // setState(() {
                      //   _isButtonPressed = !_isButtonPressed;

                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => MyFloatBut()));
                      // });
                    },
                  ),
                ),
              )),
        ),
      );
    });
  }
}
