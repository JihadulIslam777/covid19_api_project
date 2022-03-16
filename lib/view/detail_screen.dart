import 'package:covid19_api_project/view/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.cases,
      required this.active,
      required this.critical,
      required this.tests,
      required this.todayRecovered,
      required this.deaths,
      required this.recovered})
      : super(key: key);

  String? image;
  String? name;
  int? cases;
  int? recovered;
  int? deaths;
  int? active;
  int? tests;
  int? todayRecovered;
  int? critical;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .06),
                      ReusableRow(
                          title: 'Cases', value: widget.cases.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          value: widget.recovered.toString()),
                      ReusableRow(
                          title: 'Deaths', value: widget.deaths.toString()),
                      ReusableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(
                          title: 'Today recovered',
                          value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image!),
              )
            ],
          )
        ],
      ),
    );
  }
}
