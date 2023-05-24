import 'package:flutter/material.dart';

import '../../../DATA/models/ModelDataSensor.dart';
import '../SubPage1/Subpage1.dart';

class ConnectPage1 extends StatefulWidget {
  const ConnectPage1({super.key});

  @override
  State<ConnectPage1> createState() => _ConnectPage1State();
}

class _ConnectPage1State extends State<ConnectPage1> {
  List<ModelDataSensor> sectionsV4 = [
    ModelDataSensor(name: "Distance", value: 30),
    ModelDataSensor(name: "Sound", value: 40),
    ModelDataSensor(name: "Heart", value: 40),
  ];

  List<String> name = [];
  List<double> valueList = [];
  double total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in sectionsV4) {
      name.add(element.name ?? '');
      valueList.add(element.value ?? 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SubPage1(
        allData: sectionsV4,
        dataDistance: valueList[0].toString(),
        dataSound: valueList[1].toString(),
        dataHeart: valueList[2].toString(),
        values: valueList);
  }
}
