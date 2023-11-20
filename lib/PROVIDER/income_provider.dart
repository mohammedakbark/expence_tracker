// ignore_for_file: non_constant_identifier_names


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';

class incomeprovider with ChangeNotifier {
  bool isSelected = false;
  String? selectedWallet;
  String? selectedCategorry;
  void isselected() {
    notifyListeners();
  }

  void SelectedWallet() {
    notifyListeners();
  }

  void SelectedCategorry() {
    notifyListeners();
  }

  
}
