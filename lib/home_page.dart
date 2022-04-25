import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // adding mock data for chart
  static final List<WorldPopulation> populationData = [
    WorldPopulation('2016', 54, Colors.pink),
    WorldPopulation('2017', 57, Colors.purple),
    WorldPopulation('2018', 76, Colors.yellow),
    WorldPopulation('2019', 87, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WorldPopulation, String>> series = [
      charts.Series(
          data: populationData,
          id: "World Population",
          domainFn: (WorldPopulation pops, _) => pops.year,
          measureFn: (WorldPopulation pops, _) => pops.population,
          colorFn: (WorldPopulation pops, _) =>
              charts.ColorUtil.fromDartColor(pops.barColor))
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: charts.BarChart(series),
          ),
        ),
      ),
    );
  }
}

class WorldPopulation {
  final String year;
  final int population;
  final Color barColor;

  WorldPopulation(this.year, this.population, this.barColor);
}
