// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/FUNCTIONALITY/controller.dart';
import 'package:tracker/PAGES/page_home.dart';

class MyGraph extends StatefulWidget {
  final Controller inset;
  const MyGraph({super.key, required this.inset});
  @override
  State<MyGraph> createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Spend Frequency",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: LineChart(LineChartData(
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 192, 151, 245),
                              Color.fromARGB(255, 255, 255, 255),
                            ]),
                      ),
                      dotData: FlDotData(show: false),
                      color: Color.fromARGB(255, 142, 56, 255),
                      barWidth: 4,
                      isCurved: true,
                      show: true,
                      spots: [
                        FlSpot(3, 20),
                        FlSpot(4, 44),
                        FlSpot(5, 30),
                        FlSpot(6, 54),
                        FlSpot(7, 33),
                        FlSpot(8, 88),
                        FlSpot(9, 50),
                      ])
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  indicatorColor: Colors.yellow,
                  dividerColor: const Color.fromARGB(255, 0, 0, 0),
                  labelColor: Colors.orange,
                  unselectedLabelColor:
                      const Color.fromARGB(255, 151, 151, 151),
                  tabs: [
                    Text("Today"),
                    Text("Week"),
                    Text("Month"),
                    Text("Year")
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Recent Transaction",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 224, 197, 243),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefer =
                          await SharedPreferences.getInstance();
                      // await prefer.remove('IN');
                      // await prefer.remove('EX');
                      // await prefer.remove('BA');
                      await prefer.clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(inset: widget.inset),
                          ),
                          (route) => false);
                    },
                    child: Text("See All",
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 49, 255),
                        ))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
