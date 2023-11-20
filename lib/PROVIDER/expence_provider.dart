// ignore_for_file: non_constant_identifier_names


import 'package:flutter/material.dart';

class expenceprovider with ChangeNotifier{
 bool isSelected =false;
void isselected ()
{
  notifyListeners();
}  
String? selectedWallet;
void SelectedWallet ()
{
  notifyListeners();
}  
 String? selectedCategorry;
 void SelectedCategorry ()
{
  notifyListeners();
}  



}
