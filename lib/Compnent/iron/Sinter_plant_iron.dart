// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class SinterPlant extends StatefulWidget {
  const SinterPlant({super.key});

  @override
  State<SinterPlant> createState() {
    return SinterPlantState();
  }
}

class SinterPlantState extends State<SinterPlant> {
  late dynamic spiData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
    fun();
  }

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = const Color.fromARGB(255, 44, 44, 44);

  _changeColor(no) {
    setState(() {
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }
      rows[no]["selected"] = true;
      num = no;
    });
  }

  fun() {
    sinterplantService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      sinterplantService();
    });
  }

  List<dynamic> rows = [];

  sinterplantService() async {
    if (mounted) {
      await sinterplant().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            spiData = json.decode(data.body);
            rows = [
              {
                "head": "Machine Speed [m/min]",
                "data1": spiData["SP1_MCSPEED"].toStringAsFixed(2),
                "data2": spiData["SP2_MCSPEED"].toStringAsFixed(2),
                "selected": false,
                "i": 0,
              },
              {
                "head": "Burner Avg Temp [Deg C]",
                "data1": spiData["SP1_BUNERAVGTEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_BUNERAVGTEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "Waste Gas Fan [RPM]",
                "data1": spiData["SP1_WGRPM"].toStringAsFixed(0),
                "data2": spiData["SP2_WGRPM"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Production [Ton]",
                "data1": spiData["SP1_PROD"].toStringAsFixed(0),
                "data2": spiData["SP2_PROD"].toStringAsFixed(0),
                "selected": false,
                "i": 3,
              },
              {
                "head": "BF STOCK [Ton]",
                "data1": "${spiData["SP1_BFSTOCK"]}",
                "data2": "",
                "selected": false,
                "i": 4,
              },
              {
                "head": "ESSB Storage [Ton]",
                "data1": "${spiData["SP1_ESSB"]}",
                "data2": "",
                "selected": false,
                "i": 5,
              },
              {
                "head": "SLS Level[%]",
                "data1": spiData["SP1_SLS_LEVEL"].toStringAsFixed(2),
                "data2": "",
                "selected": false,
                "i": 6,
              },
              {
                "head": "SPM [mg/Nm]",
                "data1": spiData["SP1_OPCA"].toStringAsFixed(2),
                "data2": spiData["SP2_OPCA"].toStringAsFixed(2),
                "selected": false,
                "i": 7,
              },
              {
                "head": "SOX",
                "data1": spiData["SP1_SOX"].toStringAsFixed(0),
                "data2": spiData["SP2_SOX"].toStringAsFixed(0),
                "selected": false,
                "i": 8,
              },
              {
                "head": "NOX",
                "data1": spiData["SP1_NOX"].toStringAsFixed(0),
                "data2": spiData["SP2_NOX"].toStringAsFixed(0),
                "selected": false,
                "i": 9,
              },
              {
                "head": "ESP Inlet Temp[DegC]",
                "data1": spiData["SP1_ESPILTEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_ESPILTEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 10,
              },
              {
                "head": "ESP Outlet Temp[DegC]",
                "data1": spiData["SP1_ESPOLTEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_ESPOLTEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 11,
              },
              {
                "head": "Mix Gas Pressure [mmwc]",
                "data1": spiData["SP1_MIXGASPRESS"].toStringAsFixed(2),
                "data2": spiData["SP1_MIXGASPRESS"].toStringAsFixed(2),
                "selected": false,
                "i": 12,
              },
              {
                "head": "Mix Gas Flow [Nm3/hr]",
                "data1": spiData["SP1_MIXGASF"].toStringAsFixed(0),
                "data2": spiData["SP2_MIXGASF"].toStringAsFixed(0),
                "selected": false,
                "i": 13,
              },
              {
                "head": "Furnace Pressure [mbar]",
                "data1": spiData["SP1_FURNP"].toStringAsFixed(2),
                "data2": spiData["SP2_FURNP"].toStringAsFixed(2),
                "selected": false,
                "i": 14,
              },
              {
                "head": "WG Current [A]",
                "data1": spiData["SP1_WGAS_I"].toStringAsFixed(0),
                "data2": spiData["SP2_WGAS_I"].toStringAsFixed(0),
                "selected": false,
                "i": 15,
              },
              {
                "head": "WG Fan DE Bearing Temp.[DegC]",
                "data1": spiData["SP1_WGASF_DETEMP"].toStringAsFixed(0),
                "data2": spiData["SP1_WGASF_DETEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 16,
              },
              {
                "head": "WG Fan NDE Bearing Temp.[DegC]",
                "data1": spiData["SP1_WGASF_NDETEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WGASF_NDETEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 17,
              },
              {
                "head": "WG Motor DE Bearing Temp.[DegC]",
                "data1": spiData["SP1_WGASM_DETEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WGASM_DETEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 18,
              },
              {
                "head": "WG Motor NDE Bearing Temp.[DegC]",
                "data1": spiData["SP1_WGASM_NDETEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WGASM_NDETEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 19,
              },
              {
                "head": "WG Fan DE X vib[um pp]",
                "data1": spiData["SP1_WGASDEX"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASDEX"].toStringAsFixed(2),
                "selected": false,
                "i": 20,
              },
              {
                "head": "WG Fan DE Y vib[um pp]",
                "data1": spiData["SP1_WGASDEY"].toStringAsFixed(0),
                "data2": spiData["SP2_WGASDEY"].toStringAsFixed(2),
                "selected": false,
                "i": 21,
              },
              {
                "head": "WG Gas Fan NDE X vib",
                "data1": spiData["SP1_WGASNDEX"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASNDEX"].toStringAsFixed(2),
                "selected": false,
                "i": 22,
              },
              {
                "head": "WG Gas Fan NDE Y vib[um pp]",
                "data1": spiData["SP1_WGASNDEY"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASNDEY"].toStringAsFixed(2),
                "selected": false,
                "i": 23,
              },
              {
                "head": "WG Motor DE X vib[um pp]",
                "data1": spiData["SP1_WGASM_DEX"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASM_DEX"].toStringAsFixed(2),
                "selected": false,
                //"i": 25,
                "i": 24,
              },
              {
                "head": "WG Motor DE Y vib[um pp]",
                "data1": spiData["SP1_WGASM_DEY"].toStringAsFixed(0),
                "data2": spiData["SP2_WGASM_DEY"].toStringAsFixed(2),
                "selected": false,
                "i": 25,
              },
              // //data pending
              {
                "head": "WG Motor NDE X vib[um pp]",
                "data1": spiData["SP1_WGASM_NDEX"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASM_NDEX"].toStringAsFixed(0),
                "selected": false,
                "i": 26,
              },
              {
                "head": "WG Motor NDE Y vib[um pp]",
                "data1": spiData["SP1_WGASM_NDEY"].toStringAsFixed(2),
                "data2": spiData["SP2_WGASM_NDEY"].toStringAsFixed(2),
                "selected": false,
                "i": 27,
              },
              {
                "head": "Winbox No.17 Temp.[DegC]",
                "data1": spiData["SP1_WIND17TEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WIND17TEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 28,
              },
              {
                "head": "Winbox No.18 Temp.[DegC]",
                "data1": spiData["SP1_WIND18TEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WIND18TEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 29,
              },
              {
                "head": "Winbox No.19 Temp.[DegC]",
                "data1": spiData["SP1_WIND19TEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WIND19TEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 30,
              },
              {
                "head": "Winbox No.20 Temp.[DegC]",
                "data1": spiData["SP1_WIND20TEMP"].toStringAsFixed(0),
                "data2": spiData["SP2_WIND20TEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 31,
              },
              {
                "head": "BED TOTAL 1/2",
                "data1": spiData["SP1_BED2"].toStringAsFixed(0),
                "data2": spiData["SP1_BED2"].toStringAsFixed(0),
                "selected": false,
                "i": 32,
              },
              {
                "head": "BESEMIX TOTAL",
                "data1": spiData["SP1_BASE"].toStringAsFixed(0),
                "data2": "",
                "selected": false,
                "i": 33,
              },
              {
                "head": "Suction Pressure[mmwc]",
                "data1": spiData["SP1_SUCTION"].toStringAsFixed(0),
                "data2": spiData["SP2_SUCTION"].toStringAsFixed(0),
                "selected": false,
                "i": 34,
              },
              {
                "head": "Cooler Pressure [mbar]",
                "data1": spiData["SP1_COOLERPRESS"].toStringAsFixed(2),
                "data2": spiData["SP2_COOLERPRESS"].toStringAsFixed(2),
                "selected": false,
                "i": 35,
              },
            ];
            if (num != -1) {
              rows[num]["selected"] = true;
            }
            loading = false;
          });
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).clearSnackBars();
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              content: const Center(
                child: Text('Something wrong'),
              ),
              action: SnackBarAction(label: '', onPressed: () {}),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
          ? const Text("")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          113, 44, 129, 227), // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: const Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows[0]["data1"]) < 0.1
                                ? myColors["deactive"]
                                : double.parse(rows[0]["data1"]) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("SP1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: double.parse(rows[0]["data2"]) < 0.1
                                ? myColors["deactive"]
                                : double.parse(rows[0]["data2"]) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("SP2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
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
                              113, 44, 129, 227), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      child: _row(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(color: color),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),

      // Text(h, style: TextStyle(color: color)),
      // Text(d1, style: TextStyle(color: color)),
      // Text(d2, style: TextStyle(color: color)),
      // Text(d3, style: TextStyle(color: color)),
    ],
  );
}
