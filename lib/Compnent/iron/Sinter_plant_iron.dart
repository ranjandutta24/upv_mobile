// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

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
  final Color _textColor = Color.fromARGB(255, 0, 0, 0);

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
        if (!mounted) return;
        if (data != null) {
          // print(data.body);
          setState(() {
            spiData = json.decode(data.body);
            rows = [
              {
                "head": "Machine Speed [m/min]",
                "data1": double.tryParse(spiData["SP1_MCSPEED"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_MCSPEED"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 0,
              },
              {
                "head": "Burner Avg Temp [Deg C]",
                "data1": double.tryParse(spiData["SP1_BUNERAVGTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_BUNERAVGTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 1,
              },
              {
                "head": "Waste Gas Fan [RPM]",
                "data1": double.tryParse(spiData["SP1_WGRPM"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGRPM"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 2,
              },
              {
                "head": "Production [Ton]",
                "data1": double.tryParse(spiData["SP1_PROD"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_PROD"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 3,
              },
              {
                "head": "BF STOCK [Ton]",
                "data1": spiData["SP1_BFSTOCK"]?.toString() ?? '--',
                "data2": "",
                "selected": false,
                "i": 4,
              },
              {
                "head": "ESSB Storage [Ton]",
                "data1": spiData["SP1_ESSB"]?.toString() ?? '--',
                "data2": "",
                "selected": false,
                "i": 5,
              },
              {
                "head": "SLS Level[%]",
                "data1": double.tryParse(spiData["SP1_SLS_LEVEL"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": "",
                "selected": false,
                "i": 6,
              },
              {
                "head": "SPM [mg/Nm]",
                "data1": spiData["SP1_OPCA"] == null
                    ? double.tryParse(spiData["SP1_OPCA"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--'
                    : "",
                "data2": double.tryParse(spiData["SP2_OPCA"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 7,
              },
              {
                "head": "SOX",
                "data1": double.tryParse(spiData["SP1_SOX"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_SOX"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 8,
              },
              {
                "head": "NOX",
                "data1": double.tryParse(spiData["SP1_NOX"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_NOX"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 9,
              },
              {
                "head": "ESP Inlet Temp[DegC]",
                "data1": double.tryParse(spiData["SP1_ESPILTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_ESPILTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 10,
              },
              {
                "head": "ESP Outlet Temp[DegC]",
                "data1": double.tryParse(spiData["SP1_ESPOLTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_ESPOLTEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 11,
              },
              {
                "head": "Mix Gas Pressure [mmwc]",
                "data1": double.tryParse(spiData["SP1_MIXGASPRESS"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP1_MIXGASPRESS"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 12,
              },
              {
                "head": "Mix Gas Flow [Nm3/hr]",
                "data1": double.tryParse(spiData["SP1_MIXGASF"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_MIXGASF"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 13,
              },
              {
                "head": "Furnace Pressure [mbar]",
                "data1": double.tryParse(spiData["SP1_FURNP"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_FURNP"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 14,
              },
              {
                "head": "WG Current [A]",
                "data1": double.tryParse(spiData["SP1_WGAS_I"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGAS_I"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 15,
              },
              {
                "head": "WG Fan DE Bearing Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WGASF_DETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP1_WGASF_DETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 16,
              },
              {
                "head": "WG Fan NDE Bearing Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WGASF_NDETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASF_NDETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 17,
              },
              {
                "head": "WG Motor DE Bearing Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WGASM_DETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_DETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 18,
              },
              {
                "head": "WG Motor NDE Bearing Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WGASM_NDETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_NDETEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 19,
              },
              {
                "head": "WG Fan DE X vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASDEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASDEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 20,
              },
              {
                "head": "WG Fan DE Y vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASDEY"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASDEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 21,
              },
              {
                "head": "WG Gas Fan NDE X vib",
                "data1": double.tryParse(spiData["SP1_WGASNDEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASNDEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 22,
              },
              {
                "head": "WG Gas Fan NDE Y vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASNDEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASNDEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 23,
              },
              {
                "head": "WG Motor DE X vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASM_DEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_DEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                //"i": 25,
                "i": 24,
              },
              {
                "head": "WG Motor DE Y vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASM_DEY"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_DEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 25,
              },
              // //data pending
              {
                "head": "WG Motor NDE X vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASM_NDEX"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_NDEX"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 26,
              },
              {
                "head": "WG Motor NDE Y vib[um pp]",
                "data1": double.tryParse(spiData["SP1_WGASM_NDEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_WGASM_NDEY"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "selected": false,
                "i": 27,
              },
              {
                "head": "Winbox No.17 Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WIND17TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WIND17TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 28,
              },
              {
                "head": "Winbox No.18 Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WIND18TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WIND18TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 29,
              },
              {
                "head": "Winbox No.19 Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WIND19TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WIND19TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 30,
              },
              {
                "head": "Winbox No.20 Temp.[DegC]",
                "data1": double.tryParse(spiData["SP1_WIND20TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_WIND20TEMP"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 31,
              },
              {
                "head": "BED TOTAL 1/2",
                "data1": double.tryParse(spiData["SP1_BED2"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP1_BED2"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 32,
              },
              {
                "head": "BESEMIX TOTAL",
                "data1": double.tryParse(spiData["SP1_BASE"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": "",
                "selected": false,
                "i": 33,
              },
              {
                "head": "Suction Pressure[mmwc]",
                "data1": double.tryParse(spiData["SP1_SUCTION"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "data2": double.tryParse(spiData["SP2_SUCTION"]?.toString() ?? '')?.toStringAsFixed(0) ?? '--',
                "selected": false,
                "i": 34,
              },
              {
                "head": "Cooler Pressure [mbar]",
                "data1": double.tryParse(spiData["SP1_COOLERPRESS"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
                "data2": double.tryParse(spiData["SP2_COOLERPRESS"]?.toString() ?? '')?.toStringAsFixed(2) ?? '--',
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
              duration: const Duration(seconds: 2),
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
                      color: borderColor, // Border color
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
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: (double.tryParse(rows[0]["data1"].toString()) ?? 0.0) < 0.1
                                ? myColors["deactive"]
                                : (double.tryParse(rows[0]["data1"].toString()) ?? 0.0) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("SP1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: (double.tryParse(rows[0]["data2"].toString()) ?? 0.0) < 0.1
                                ? myColors["deactive"]
                                : (double.tryParse(rows[0]["data2"].toString()) ?? 0.0) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("SP2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
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
                          color: borderColor, // Border color
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
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 40,
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),

      // Text(h, style: TextStyle(color: color)),
      // Text(d1, style: TextStyle(color: color)),
      // Text(d2, style: TextStyle(color: color)),
      // Text(d3, style: TextStyle(color: color)),
    ],
  );
}
