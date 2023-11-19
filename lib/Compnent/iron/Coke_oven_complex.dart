import 'package:flutter/material.dart';

class Coc extends StatefulWidget {
  const Coc({super.key});

  @override
  State<Coc> createState() {
    return CocState();
  }
}

class CocState extends State<Coc> {
  late dynamic cocData;
  var loading = false;
  var num = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: loading
            ? const Text(" ")
            : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(113, 43, 76, 98),
                        width: 2.0,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color.fromARGB(113, 74, 104, 156),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              child: const Text('Production',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color.fromARGB(113, 56, 104, 156),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              child: const Text("Value 1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 152, 152, 152),
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0),
                              child: const Text("Value 2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 152, 152, 152),
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ]),
                  ),
                ],
              ));
  }
}
