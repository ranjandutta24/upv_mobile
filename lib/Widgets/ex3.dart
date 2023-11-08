import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table Row Color Change Example'),
        ),
        body: DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatefulWidget {
  @override
  createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  int selectedRow = -1; // Index of the currently selected row
  List<dynamic> rows = [
    {
      "h": "33",
      "d": "11",
      "selected": false,
      "i": 0,
    },
    {"h": "44", "d": "22", "selected": false, "i": 1},
    {"h": "55", "d": "33", "selected": false, "i": 2},
  ];
  Color _containerColor = Colors.blue; // Initial background color
  Color _containerColora =
      const Color.fromARGB(255, 255, 255, 255); // Initial background color

  _changeColor(no) {
    setState(() {
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }

      rows[no]["selected"] = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        for (final Map r in rows)
          GestureDetector(
            onTap: () {
              _changeColor(r["i"]);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: r["selected"] == true
                      ? _containerColor
                      : _containerColora,
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 165, 165, 165), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                child: Row(
                  children: [
                    Text(r["h"]),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(r["h"]),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(r["selected"].toString())
                  ],
                )),
          )
      ],
    ));
  }
}
