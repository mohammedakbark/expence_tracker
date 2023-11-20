// ignore_for_file: prefer_const_constructors,, must_be_immutable 

// import 'package:flutter/foundation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_switch/flutter_switch.dart';

class TransferPge extends StatelessWidget {
 TransferPge({super.key});

  bool isSelected = false;

  List<String> categoryList = ["1", "2", "3"];

  List<String> walletList = ["a", "b", "c"];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0077FF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Transfer",
            style: TextStyle(fontSize: 25, letterSpacing: 1),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(9.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/left-arrow.png",
                color: Colors.white,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 400, right: 170),
              child: Text(
                "How much?",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(163, 255, 255, 255)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                autofocus: true,
                style: TextStyle(
                    fontSize: 80,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabled: true,
                  contentPadding: EdgeInsets.only(
                    left: 40,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.attach_money_outlined,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  hintText: "0",
                  hintStyle: TextStyle(fontSize: 80, color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Stack(
                          // alignment: Alignment.topLeft,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 180,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "From",
                                    hintStyle: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: SizedBox(
                                height: 60,
                                width: 180,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "To",
                                      hintStyle: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 160,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                height: 55,
                                width: 55,
                                child: Image.asset(
                                  "assets/trans.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: DottedBorder(
                            strokeWidth: .1,
                            child: SizedBox(
                              height: 65,
                              width: 370,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      "assets/attachment.png",
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Add attachment",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          height: 60,
                          width: 400,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 93, 0, 255))),
                              onPressed: () {},
                              child: Text(
                                " Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    letterSpacing: 1),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
