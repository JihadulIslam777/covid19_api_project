import 'dart:ffi';

import 'package:covid19_api_project/Model/world_state.dart';
import 'package:covid19_api_project/services/state_services.dart';
import 'package:covid19_api_project/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  _WorldStatesState createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa160),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              FutureBuilder(
                future: statesServices.fetchWorldStatesRecords(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: _controller,
                      ),
                    );
                  } else {
                    var data = snapshot.data!;
                    return Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          PieChart(
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            dataMap: {
                              'Total':
                                  double.parse(snapshot.data!.cases.toString()),
                              'Recovered': double.parse(
                                  snapshot.data!.recovered.toString()),
                              'Deaths': double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            animationDuration:
                                const Duration(microseconds: 3000),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * .06),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'Total',
                                      value: data.cases.toString()),
                                  ReusableRow(
                                      title: 'Deaths',
                                      value: data.deaths.toString()),
                                  ReusableRow(
                                      title: 'Recovered',
                                      value: data.recovered.toString()),
                                  ReusableRow(
                                      title: 'Active',
                                      value: data.active.toString()),
                                  ReusableRow(
                                      title: 'Critical',
                                      value: data.critical.toString()),
                                  ReusableRow(
                                      title: 'Today Deaths',
                                      value: data.todayDeaths.toString()),
                                  ReusableRow(
                                      title: 'Today Recovered',
                                      value: data.todayRecovered.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const CountriesList()));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1aa260),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text('Track Countries'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  String? title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!),
              Text(value!),
            ],
          ),
          const SizedBox(height: 5),
          const Divider()
        ],
      ),
    );
  }
}
