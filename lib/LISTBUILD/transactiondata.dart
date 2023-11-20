import 'package:flutter/material.dart';
import 'package:tracker/LISTBUILD/transaModel.dart';

ValueNotifier<List<TransactionModel>> transactionListNotifier =
    ValueNotifier([]);

void addTransaction(TransactionModel value) async {
  transactionListNotifier.value.add(value);
  transactionListNotifier.notifyListeners();

  // final preferee = await SharedPreferences.getInstance();
  // value.Category = preferee.getString("CATEGORY")??"";
  // await preferee.setString("CAT", value.Category);
  // value.Description = preferee.getString("DESCRIPTION")??"";
  // await preferee.setString("DES", value.Description);
  // value.amount = preferee.getString("AMOUNT")??"";
  // await preferee.setString("AMO", value.amount);
  // value.Time = preferee.getString("TIME")??"";
  // await preferee.setString("TI", value.Time);
}
