// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class Lhfsm extends StatefulWidget {
  const Lhfsm({super.key});

  @override
  State<Lhfsm> createState() {
    return LhfsmState();
  }
}

class LhfsmState extends State<Lhfsm> {
  late dynamic lhfData;
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
    if (mounted) {
      lfService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        lfService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  // Helper: resolve LF heat status number to text
  String _statusText(dynamic statusCode) {
    if (statusCode == 1) return "Start of Heat";
    if (statusCode == 3) return "Arcing";
    if (statusCode == 5) return "Arcing Stopped";
    if (statusCode == 8) return "Heat End";
    return "Stopped";
  }

  // Helper: resolve LF heat status number to color
  Color _statusColor(dynamic statusCode) {
    if (statusCode == 1) return const Color(0xFFFFC700);
    if (statusCode == 3) return const Color(0xFF416D19);
    if (statusCode == 5) return const Color(0xFF9A031E);
    if (statusCode == 8) return const Color(0xFF9A031E);
    return const Color(0xFF9A031E);
  }

  // Safe string conversion
  String _safe(dynamic v, {String def = '0'}) =>
      v == null ? def : v.toString();

  // Safe double toFixed
  String _safeFixed(dynamic v, int decimals, {String def = '0.00'}) {
    if (v == null) return def;
    final d = double.tryParse(v.toString());
    if (d == null || d.isNaN) return def;
    return d.toStringAsFixed(decimals);
  }

  // Safe int round
  String _safeRound(dynamic v, {String def = '0'}) {
    if (v == null) return def;
    final d = double.tryParse(v.toString());
    if (d == null || d.isNaN) return def;
    return d.round().toString();
  }

  // Mimics JS: parseFloat(v).toFixed(2)
  // Returns "NaN" when value is null or not a number — intentional, matching web behaviour
  String _jsFixed(dynamic v, int decimals) {
    if (v == null) return 'NaN';
    final d = double.tryParse(v.toString());
    if (d == null || d.isNaN) return 'NaN';
    return d.toStringAsFixed(decimals);
  }

  lfService() async {
    if (mounted) {
      await ladleheatingfurnace().then((data) {
        if (!mounted) return;
        if (data != null && mounted) {
//         if (!mounted) return;
//         if (data != null) {
//           // print(data.body);
          setState(() {
            lhfData = json.decode(data.body);

            final lf1StatusColor = _statusColor(lhfData["LF1_HEAT_STATUS"]);
            final lf2StatusColor = _statusColor(lhfData["LF2_HEAT_STATUS"]);
            final lf1StatusText = _statusText(lhfData["LF1_HEAT_STATUS"]);
            final lf2StatusText = _statusText(lhfData["LF2_HEAT_STATUS"]);

            rows = [
              {
                "head": "Status",
                "data1": lf1StatusText,
                "data2": lf2StatusText,
                "color1": lf1StatusColor,
                "color2": lf2StatusColor,
                "isStatus": true,
//                 "head": "Temp [DegC]",
//                 "data1":
//                     "${lhfData["LF1_TEMP1"]?.toString() ?? '--'}/${lhfData["LF1_TEMP2"]?.toString() ?? '--'}/${lhfData["LF1_TEMP3"]?.toString() ?? '--'}",
//                 "data2":
//                     "${lhfData["LF2_TEMP1"]?.toString() ?? '--'}/${lhfData["LF2_TEMP2"]?.toString() ?? '--'}/${lhfData["LF2_TEMP3"]?.toString() ?? '--'}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Arcing Time [min]",
                "data1": _safe(lhfData["LF1_ARCHING_TIME"]),
                "data2": _safe(lhfData["LF2_ARCHING_TIME"]),
                "isStatus": false,
//                 "head": "Current [Amp]",
//                 "data1":
//                     "${double.tryParse(lhfData["LF1_I1"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}/${double.tryParse(lhfData["LF1_I2"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}/${double.tryParse(lhfData["LF1_I3"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}",
//                 "data2":
//                     "${double.tryParse(lhfData["LF2_I1"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}/${double.tryParse(lhfData["LF2_I2"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}/${double.tryParse(lhfData["LF2_I3"]?.toString() ?? '')?.toStringAsFixed(1) ?? '--'}",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Treatment Time [min]",
                "data1": _safe(lhfData["LF1_TREATMENT_TIME"]),
                "data2": _safe(lhfData["LF2_TREATMENT_TIME"]),
                "isStatus": false,
                "selected": false,
                "i": 2,
              },
              {
                "head": "Tap_Selected",
                "data1": _safe(lhfData["LF1_TRAFO_TAP"]),
                "data2": _safe(lhfData["LF2_TRAFO_TAP"]),
                "isStatus": false,
                "selected": false,
                "i": 3,
              },
              {
                "head": "Energy_Consm [MWh]",
                "data1": _safeFixed(lhfData["LF1_ACT_ENERGY_CONS"], 2),
                "data2": _safeFixed(lhfData["LF2_ACT_ENERGY_CONS"], 2),
                "isStatus": false,
                "selected": false,
                "i": 4,
              },
              {
                "head": "Ladle No",
                "data1": _safe(lhfData["LF1_LADLE_ID"]),
                "data2": _safe(lhfData["LF2_LADLE_ID"]),
                "isStatus": false,
                "selected": false,
                "i": 5,
              },
              {
                "head": "Booster Fan Status",
                "data1": (lhfData["LF1_BOOSTERFAN_ON"] == 1) ? "On" : "Off",
                "data2": (lhfData["LF2_BOOSTERFAN_ON"] == 1) ? "On" : "Off",
                "isStatus": false,
                "selected": false,
                "i": 6,
              },
              {
                "head": "CaSi/Fe Wire Spd SP/Act",
                "data1":
                    "${_safeRound(lhfData["LF1_WIREFEEDER_STD2_SPEED_SP"])} / ${_jsFixed(lhfData["ACTSPD1"], 2)}",
                "data2":
                    "${_safeRound(lhfData["LF2_WIREFEEDER_STD2_SPEED_SP"])} / ${_jsFixed(lhfData["ACTSPD3"], 2)}",
                "isStatus": false,
                "selected": false,
                "i": 7,
              },
              {
                "head": "CaSi/Fe Wire Lth Act",
                "data1": _safeRound(lhfData["LF1_WIREFEEDER_STD2_LENGTH_FEED"]),
                "data2": _safeRound(lhfData["LF2_WIREFEEDER_STD2_LENGTH_FEED"]),
                "isStatus": false,
                "selected": false,
                "i": 8,
              },
              {
                "head": "CaSi/Fe Wire Wt SP/Act",
                "data1":
                    "${_safeRound(lhfData["LF1_WIREFEEDER_STD2_WEIGHT_SP"])} / ${_safeRound(lhfData["LF1_WIREFEEDER_STD2_WEIGHT_PV"])}",
                "data2":
                    "${_safeRound(lhfData["LF2_WIREFEEDER_STD2_WEIGHT_SP"])} / ${_safeRound(lhfData["LF2_WIREFEEDER_STD2_WEIGHT_PV"])}",
                "isStatus": false,
                "selected": false,
                "i": 9,
              },
              {
                "head": "Al Wire Spd SP/Act",
                "data1":
                    "${_safeRound(lhfData["LF1_WIREFEEDER_STD1_SPEED_SP"])} / ${_jsFixed(lhfData["ACTSPD4"], 2)}",
                "data2":
                    "${_safeRound(lhfData["LF2_WIREFEEDER_STD1_SPEED_SP"])} / ${_jsFixed(lhfData["ACTSPD4"], 2)}",
                "isStatus": false,
                "selected": false,
                "i": 10,
              },
              {
                "head": "Al Wire Lth Act",
                "data1": _safeRound(lhfData["LF1_WIREFEEDER_STD1_LENGTH_FEED"]),
                "data2": _safeRound(lhfData["LF2_WIREFEEDER_STD1_LENGTH_FEED"]),
                "isStatus": false,
                "selected": false,
                "i": 11,
              },
              {
                "head": "Al Wire Wt SP/Act",
                "data1":
                    "${_safeRound(lhfData["LF1_WIREFEEDER_STD1_WEIGHT_SP"])} / ${_safeRound(lhfData["LF1_WIREFEEDER_STD1_WEIGHT_PV"])}",
                "data2":
                    "${_safeRound(lhfData["LF2_WIREFEEDER_STD1_WEIGHT_SP"])} / ${_safeRound(lhfData["LF2_WIREFEEDER_STD1_WEIGHT_PV"])}",
                "isStatus": false,
                "selected": false,
                "i": 12,
              },
            ];

            state = [
              {"data1": lhfData["LF1_I1"] ?? 0.0, "data2": lhfData["LF2_I1"] ?? 0.0}
            ];
            if (num != -1) {
              rows[num]["selected"] = true;
            }
            loading = false;
          });
        } else if (mounted) {
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
          ? const Text(" ")
          : Column(
              children: [
                // Header row
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: borderColor,
                    width: 2.0,
                  )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(238, 205, 205, 205),
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 3),
                            child: Text('Parameters',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: borderColor)),
                          )),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: state[0]["data1"] == null
                                ? myColors["deactive"]
                                : (double.tryParse(state[0]["data1"].toString()) ?? 0) <= 0.1
                                    ? myColors["deactive"]
                                    : (double.tryParse(state[0]["data1"].toString()) ?? 0) >= 1.0
                                        ? myColors["active"]
                                        : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: state[0]["data2"] == null
                                ? myColors["deactive"]
                                : (double.tryParse(state[0]["data2"].toString()) ?? 0) <= 0.1
                                    ? myColors["deactive"]
                                    : (double.tryParse(state[0]["data2"].toString()) ?? 0) >= 1.0
                                        ? myColors["active"]
                                        : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF2",
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
                    child: r["isStatus"] == true
                        ? _statusRow(
                            r["head"],
                            r["data1"],
                            r["data2"],
                            r["color1"] as Color,
                            r["color2"] as Color,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: r["selected"] == true
                                  ? _containerColor
                                  : _containerColora,
                              border: Border.all(
                                color: borderColor,
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 3),
                            child: _row(
                                r["head"],
                                r["data1"],
                                r["data2"],
                                r["selected"] == true
                                    ? _containerColora
                                    : _textColor,
                                r["i"]),
                          ),
                  ),
              ],
            ),
    );
  }
}

// Status row with coloured cells per LF
Widget _statusRow(
  String head,
  String d1,
  String d2,
  Color color1,
  Color color2,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 1.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(238, 205, 205, 205),
              border: Border(
                right: BorderSide(color: borderColor, width: 2.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            child: Text(
              head,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: borderColor, fontSize: 12),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: color1,
              border: Border(
                right: BorderSide(color: borderColor, width: 2.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: Text(
              d1,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: 40,
            color: color2,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: Text(
              d2,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _row(h, d1, d2, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 10,
        child: Container(
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
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 8,
        child: Container(
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
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 8,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
