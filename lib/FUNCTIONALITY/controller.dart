// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:shared_preferences/shared_preferences.dart';

class Controller {
  int mainbalance = 0;
  int mainincome = 0;
  int mainexpence = 0;
  Future<void> updatedIncome(int valuee) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setInt("IN", mainincome+=valuee);
    await prefer.setInt("BA", mainbalance+=valuee);
    // bool CheckValuee = prefer.containsKey('INCOME');
    // print(CheckValuee);
  }
  Future<void> updatedExpence(int value) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setInt("EX", mainexpence+=value);
    await prefer.setInt("BA", mainbalance-=value);
  }
}
