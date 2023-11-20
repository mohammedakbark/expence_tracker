// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable

// import 'package:figma/FUNCTIONALITY/controller.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/PAGES/page_home.dart';
import 'package:tracker/PROVIDER/income_provider.dart';



class IncomePge extends StatelessWidget {
  final Controller inset;

  final obj = incomeprovider();
  IncomePge({
    super.key,
    required this.inset,

    // required this.obj
  });
  List<String> categoryList = ["Salary", "Rent", "Profit"];
  List<String> walletList = ["Debit Card", "Credit Card", "Bank"];
  final TextEditingController incomecontroller = TextEditingController();
  final TextEditingController descreptionController = TextEditingController();
//  String? selectedCategorry;
  String? currentTime;
  void Cash()  {
    String aa = incomecontroller.text.trim();
    int bb = int.parse(aa);
    inset.updatedIncome(bb);
    String des =
    descreptionController.text;
    currentTime = TimeOfDay.fromDateTime(DateTime.now()).toString();

    // final transaction = TransactionModel(
    //     Time: currentTime!,
    //     Category: selectedCategorry!,
    //     Description: des,
    //     amount: bb.toString());
    // addTransaction(transaction);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF00A86B),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Income",
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
      body: Consumer<incomeprovider>(builder: (context, incpro, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200, right: 170),
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
                  controller: incomecontroller,
                  autofocus: true,
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabled: true,
                    contentPadding: EdgeInsets.only(
                      left: 40,
                    ),
                    prefixIconConstraints: BoxConstraints(maxWidth: 80),
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
                  height: 590,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonFormField(
                            padding: EdgeInsets.all(10),
                            decoration: InputDecoration(
                                focusColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: "Category",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            items: categoryList.map((String item) {
                              return DropdownMenuItem(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (newValue) {
                              incpro.selectedCategorry = newValue;
                              // setState(() {
                              // selectedCategorry = newValue;
                              // });
                            }),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: descreptionController,
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: "Wallet",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            padding: EdgeInsets.only(
                                bottom: 20, top: 10, left: 10, right: 10),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            items: walletList.map((String item) {
                              return DropdownMenuItem(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (newValue) {
                              incpro.SelectedWallet();
                              incpro.selectedWallet = newValue;
                              // setState(() {
                              //   selectedWallet = newValue;
                              // });
                            }),
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
                          padding: const EdgeInsets.only(top: 35, bottom: 35),
                          child: SizedBox(
                            height: 65,
                            width: 360,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Repeat",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text("Repeat transaction")
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 190,
                                  ),
                                  child: FlutterSwitch(
                                      width: 50,
                                      height: 30,
                                      inactiveColor:
                                          Color.fromARGB(255, 213, 180, 243),
                                      value: incpro.isSelected,
                                      onToggle: (selected) {
                                        incpro.isSelected = selected;
                                        incpro.isselected();

                                        // setState(() {
                                        //   isSelected = selected;
                                        // });
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 400,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 93, 0, 255))),
                              onPressed: () {
                                Cash();
                                if (incpro.selectedCategorry != null &&
                                    incpro.selectedWallet != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                //  obj:widget.obj ,
                                                inset: inset,
                                              )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "please fill all given options "),
                                      duration: Duration(
                                          seconds:
                                              3), // How long the SnackBar will be visible
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                " Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    letterSpacing: 1),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
