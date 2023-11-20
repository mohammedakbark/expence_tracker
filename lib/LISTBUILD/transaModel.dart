// ignore_for_file: file_names, non_constant_identifier_names



class TransactionModel {
  String Category;
  String Description;
  String amount;
  String Time;

  TransactionModel({
    required this.Category,
    required this.Description,
    required this.amount,
    required this.Time,
  });
  // Future<void> setvalue() async {
  //   final prefer = await SharedPreferences.getInstance();
  //   prefer.setString("CATEGORY", Category);
  //   prefer.setString("DESCRIPTION", Description);
  //   prefer.setString("AMOUNT", amount);
  //   prefer.setString("TIME", Time);
  // }
}
