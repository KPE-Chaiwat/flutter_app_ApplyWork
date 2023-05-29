import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../DATA/models/ModelDataSensor.dart';
import '../../../components/ColorsTheme.dart';
import '../../../components/donutpieChartV5.dart';
import 'component_SP1/appbars/appbarSP1.dart';
import '../../../components/Component_Layout/frame/frame.dart';
import '../../../cubit/ChengPage.dart';
import '../../../cubit/shared_preferance_cubit.dart';
import '../../page2/page2.dart';
import '../Page1.dart';

class SubPage1 extends StatelessWidget {
  SubPage1(
      {super.key,
      required this.allData,
      this.dataDistance,
      this.dataSound,
      this.dataHeart,
      this.values});
  List<ModelDataSensor> allData;
  String? dataDistance, dataSound, dataHeart;
  List<double>? values;
  @override
  Widget build(BuildContext context) {
    return WidgetFrame(
      modeFrame: 3,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          Icons.logout,
                        ),
                        onPressed: () {
                          context
                              .read<SharedPreferanceCubit>()
                              .SaveText_LogOUT();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: 30,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Data received Sensor",
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Card(
                    color: ColorsTheme.MintGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: Colors.transparent,
                              child: Text(
                                "Total Value",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: Colors.transparent,
                              child: Text(
                                "1200",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              height: 50,
                              color: Colors.transparent,
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 70,
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Distance",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      dataDistance ?? "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: 70,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Sound",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    dataSound ?? "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              height: 70,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Heart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    dataHeart ?? "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                DonutChartWidgetV5(values: values),
                SizedBox(
                  height: 50,
                ),
                // InkWell(
                //   onTap: () {
                //     context.read<ChengePage_Cubit>().changePage(go: Page2());
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     width: 300,
                //     height: 60,
                //     child: Text("go to page 2"),
                //   ),
                // ),
                for (int i = 0; i < allData.length; i++) ...{
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(allData[i].name.toString()),
                        Text(allData[i].value.toString()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(color: Colors.black),
                  )
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
