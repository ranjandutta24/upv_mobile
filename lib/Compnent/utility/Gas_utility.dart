import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class GasUt extends StatefulWidget {
  const GasUt({super.key});
  @override
  State<GasUt> createState() {
    return GasUtState();
  }
}

class GasUtState extends State<GasUt> {
  late dynamic gasUtilityData;
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
      gasutilityService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        gasutilityService();
      });
    }
  }

  List<dynamic> rows = [];

  gasutilityService() async {
    if (mounted) {
      await gasutility().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            gasUtilityData = json.decode(data.body);
            rows = [
              {
                "head": "Production (Nm3/hr)",
                "data1": gasUtilityData["BF_GASFLOWHI"].toString(),
                "data2":
                    "${gasUtilityData["BPP_COMAKE_F"].toString()}[11] + ${gasUtilityData["COB10_GASMAKEF"].toString()}[10]",
                "data3": "NA",
                "data4": "0",
                "data5": "0",
                "data6": "NA",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Produced Gas Press.",
                "data1": gasUtilityData["BF_CONP"].toString(),
                "data2":
                    "${gasUtilityData["BPP_COMAKE_P"].toString()}[11] / ${gasUtilityData["COB10_COGSUPPLY"].toString()}[10]",
                "data3": "NA",
                "data4": "NA",
                "data5": "NA",
                "data6": "NA",
                "selected": false,
                "i": 1,
              },
              {
                "head": "BF Consumption(Nm3/hr)",
                "data1": gasUtilityData["BF_CONF"].toString(),
                "data2": gasUtilityData["BF_COF"].toString(),
                "data3": "NA",
                "data4": gasUtilityData["BF_O2EN"].toString(),
                "data5": gasUtilityData["BF_N2F"].toString(),
                "data6": gasUtilityData["BF_STVGF"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "BFCDI",
                "data1": "0",
                "data2": "0",
                "data3": "NA",
                "data4": "NA",
                "data5": gasUtilityData["BFCDI_N2F"].toString(),
                "data6": "NA",
                "selected": false,
                "i": 3,
              },
              {
                "head": "PBS#2 Consumption(Nm3/hr)",
                "data1": gasUtilityData["PBS_BBFGF"].toString(),
                "data2": gasUtilityData["PBS_BCOGF"].toString(),
                "data3": gasUtilityData["PBS_BCBMF"].toString(),
                "data4": "NA",
                "data5": "NA",
                "data6": gasUtilityData["PBS_BOFTOT"].toString(),
                "selected": false,
                "i": 4,
              },
              {
                "head": "COB#10 Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["COB10_COGCON"].toString(),
                "data3": "NA",
                "data4": "NA",
                "data5": "NA",
                "data6": "NA",
                "selected": false,
                "i": 5,
              },
              {
                "head": "COB#11 Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["CO_GAS_F"].toString(),
                "data3": "NA",
                "data4": "NA",
                "data5": gasUtilityData["CD_N2_CON_F"].toString(),
                "data6": "NA",
                "selected": false,
                "i": 6,
              },
              {
                "head": "BOF Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": "NA",
                "data3": gasUtilityData["BOF_CBMF"].toString(),
                "data4": gasUtilityData["O2_TOTAL"].toString(),
                "data5": gasUtilityData["BOF_PRSF"].toString(),
                "data6": "NA",
                "selected": false,
                "i": 7,
              },
              // <td>{{ gasutility.BOF_CBMF }}</td>
              //         <td>{{ gasutility.O2_TOTAL }}</td>
              //         <td>{{ gasutility.BOF_PRSF }}</td>
              {
                "head": "CCP Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["CCP_COF"].toString(),
                "data3": gasUtilityData["CCP_CBMF"].toString(),
                "data4": gasUtilityData["CCP_O2F"].toString(),
                "data5": gasUtilityData["CCP_N2F"].toString(),
                "data6": "NA",
                "selected": false,
                "i": 8,
              },
              {
                "head": "MILLS Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["GMS_CO_FLOW"].toString(),
                "data3": "NA",
                "data4": "NA",
                "data5": "NA",
                "data6": gasUtilityData["MILLS_MIXED"].toString(),
                "selected": false,
                "i": 9,
              },
              {
                "head": "SINTER Consumption (Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["SP_CO_GAS"].toString(),
                "data3": "NA",
                "data4": "NA",
                "data5": "NA",
                "data6": "NA",
                "selected": false,
                "i": 10,
              },
              {
                "head": "LDCP Consumption(Nm3/hr)",
                "data1": "NA",
                "data2": gasUtilityData["COG_FLOW_GMS"].toString(),
                "data3": gasUtilityData["LDCP_CBMF"].toString(),
                "data4": "NA",
                "data5": gasUtilityData["LDCP_N2F"].toString(),
                "data6": gasUtilityData["LDCP_MIXGASF"].toString(),
                "selected": false,
                "i": 11,
              },
              {
                "head": "Flare(Nm3/hr)",
                "data1": gasUtilityData["BF_FLAREF"].toString(),
                "data2": "0",
                "data3": "NA",
                "data4": "NA",
                "data5": "NA",
                "data6": "NA",
                "selected": false,
                "i": 12,
              },
              {
                "head": "Total Production",
                "data1": gasUtilityData["total_Production_BF"].toString(),

                // this.gasutility.BPP_COMAKE_F + this.gasutility.COB10_GASMAKEF
                "data2": (gasUtilityData["BPP_COMAKE_F"] +
                        gasUtilityData["COB10_GASMAKEF"])
                    .toString(),
                "data3": gasUtilityData["total_Production_CBM"].toString(),
                "data4": gasUtilityData["total_Production_Oxygen"].toString(),
                "data5": gasUtilityData["total_Production_Nitrogen"].toString(),
                "data6": gasUtilityData["total_Production_Mixed"].toString(),
                "selected": false,
                "i": 13,
              },
              {
                "head": "Total Consumption",
                "data1":
                    (gasUtilityData["BF_CONF"] + gasUtilityData["PBS_BBFGF"])
                        .toString(),
                "data2": (gasUtilityData["BF_COF"] +
                        gasUtilityData["PBS_BCOGF"] +
                        gasUtilityData["COB10_COGCON"] +
                        gasUtilityData["CO_GAS_F"] +
                        gasUtilityData["GMS_CO_FLOW"] +
                        gasUtilityData["SP_CO_GAS"])
                    .toString(),
                "data3": ((gasUtilityData["PBS_BCBMF"] ?? 0) +
                        (gasUtilityData["BOF_CBMF"] ?? 0) +
                        (gasUtilityData["CCP_CBMF"] ?? 0) +
                        (gasUtilityData["LDCP_CBMF"] ?? 0))
                    .toString(),
                "data4": (gasUtilityData["BF_O2EN"] ??
                        0 + gasUtilityData["O2_TOTAL"] ??
                        0 + gasUtilityData["CCP_O2F"] ??
                        0)
                    .toString(),
                "data5": (gasUtilityData["BF_N2F"] ??
                        0 + gasUtilityData["CD_N2_CON_F"] ??
                        0 + gasUtilityData["BOF_PRSF"] ??
                        0 + gasUtilityData["CCP_N2F"] ??
                        0 + gasUtilityData["LDCP_N2F"] ??
                        0)
                    .toString(),
                //  + this.gasutility.LDCP_MIXGASF;
                "data6": (gasUtilityData["BF_STVGF"] ??
                        0 + gasUtilityData["PBS_BOFTOT"] ??
                        0 + gasUtilityData["MILLS_MIXED"] ??
                        0 + gasUtilityData["LDCP_MIXGASF"] ??
                        0)
                    .toString(),
                "selected": false,
                "i": 14,
              },
              {
                "head": "Total Flare",
                "data1": gasUtilityData["BF_FLAREF"].toString(),
                "data2": "0",
                "data3": "0",
                "data4": "0",
                "data5": "0",
                "data6": "0",
                "selected": false,
                "i": 15,
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
                          r["data3"],
                          r["data4"],
                          r["data5"],
                          r["data6"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, d4, d5, d6, color, i) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // flex: 4,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                h,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "BF Gas",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d1,
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "CO Gas",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d2,
                style: TextStyle(color: color),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "CBM Gas",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d3,
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Oxygen",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d4,
                style: TextStyle(color: color),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Nitrogen",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d5,
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Mixed Gas",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d6,
                style: TextStyle(color: color),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
