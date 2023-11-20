// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/LISTBUILD/transaModel.dart';
import 'package:tracker/LISTBUILD/transactiondata.dart';

class Elementss extends StatelessWidget {
  // final bool isVisibleValue;
  final Controller inset;
  const Elementss({super.key, required this.inset});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: ValueListenableBuilder(
        valueListenable: transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> transactionList,
            Widget? child) {
          return ListView.separated(
              reverse: true,
              itemBuilder: (ctx, index) {
                final data = transactionList[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 249, 245, 244)),
                      child: ListTile(
                          leading:
                              Image(image: AssetImage("assets/restaurant.png")),
                          title: Text(
                            data.Category.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                          subtitle: Text(
                            data.Description.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                data.amount.toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                              Text(data.Time.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ))),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: transactionList.length);
        },
      ),
    );
  }
}
