import 'package:flutter/material.dart';

import 'sensor_tani.dart';
import 'line_chart_widget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Kelembapan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Data Kelembapan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<List<HumidityPoint>>(
                future: getPoints(context),
                  builder: (BuildContext context, AsyncSnapshot<List<HumidityPoint>> snapshot) {
                    if (!snapshot.hasData) {
                      // while data is loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      // data loaded:
                      final data = snapshot.data;
                      return LineChartWidget(data!);
                    }
                  })
              ,
            ],
          ),
        ),
      ),
    );
  }
}