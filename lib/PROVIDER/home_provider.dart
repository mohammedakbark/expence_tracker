// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';

class HomeProvider with ChangeNotifier {
  
  final Controller inset = Controller();
  bool isButtonPressed = false;
  String? selectedItem;
  void isbuttonpressed() {
    isButtonPressed = !isButtonPressed;
    notifyListeners();
  }

  void selecteditem(newValue) {
    selectedItem = newValue;
    //or
    //selecteditem;
    notifyListeners();
  }

//  void savedDataPrefer() async {
//     SharedPreferences prefer = await SharedPreferences.getInstance();

//     inset.mainbalance = prefer.getInt("BA") ?? 0;
//     inset.mainincome = prefer.getInt("IN") ?? 0;
//     inset.mainexpence = prefer.getInt("EX") ?? 0;
//     // widget.obj.Category = prefer.getString("CAT")??"";
//     // widget.obj.Description = prefer.getString("DES")??"";
//     // widget.obj.Time = prefer.getString("TI")??"";
//     // widget.obj.amount = prefer.getString("AMO")??"";
//     notifyListeners();
//   }
}
