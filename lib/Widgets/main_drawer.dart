import 'package:flutter/material.dart';
import 'package:upv_mobile/Screens/iron_page.dart';
import 'package:upv_mobile/Screens/overview_page.dart';
import 'package:upv_mobile/Screens/steel_mills_page.dart';
import 'package:upv_mobile/Screens/utility_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    // print(data);
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 39, 66, 116),
              Color.fromARGB(255, 39, 66, 116),
              // Theme.of(context).colorScheme.primaryContainer,
              // Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.perm_identity_rounded,
                    size: 30,
                    color: Color.fromARGB(234, 254, 254, 254),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${data["firstname"]} ${data["lastname"] ?? ""}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      fontFamily: "CustomFont",
                      color: Color.fromARGB(234, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${data["role"]}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: "CustomFont",
                  color: Color.fromARGB(234, 255, 255, 255),
                ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.menu, size: 26, color: myColors["theme"]),
          title: Text(
            'Overview',
            style: TextStyle(
                color: myColors["theme"],
                fontSize: 18,
                fontFamily: "CustomFont"),
          ),
          onTap: () {
            Navigator.replace(
              context,
              oldRoute: ModalRoute.of(context)!,
              newRoute: MaterialPageRoute(
                  builder: (context) => OverviewScreen(
                        data: data,
                      )),
            );
          },
        ),
        // const SizedBox(height: 12),
        data["role"] != "OVERVIEW"
            ? ListTile(
                leading: Icon(
                  Icons.iron,
                  size: 26,
                  color: myColors["theme"],
                ),
                title: Text(
                  'Iron',
                  style: TextStyle(
                      color: myColors["theme"],
                      fontSize: 18,
                      fontFamily: "CustomFont"),
                ),
                onTap: () {
                  Navigator.replace(
                    context,
                    oldRoute: ModalRoute.of(context)!,
                    newRoute: MaterialPageRoute(
                        builder: (context) => IronScreen(data: data)),
                  );
                },
              )
            : const SizedBox(),
        data["role"] != "OVERVIEW"
            ? ListTile(
                leading: Icon(
                  Icons.bolt_sharp,
                  size: 26,
                  color: myColors["theme"],
                ),
                title: Text(
                  'Steel/Mills',
                  style: TextStyle(
                      color: myColors["theme"],
                      fontSize: 18,
                      fontFamily: "CustomFont"),
                ),
                onTap: () {
                  Navigator.replace(
                    context,
                    oldRoute: ModalRoute.of(context)!,
                    newRoute: MaterialPageRoute(
                        builder: (context) => SteelMillsScreen(data: data)),
                  );
                },
              )
            : const SizedBox(),
        data["role"] != "OVERVIEW"
            ? ListTile(
                leading: Icon(
                  Icons.checklist,
                  size: 26,
                  color: myColors["theme"],
                ),
                title: Text(
                  'Utility',
                  style: TextStyle(
                      color: myColors["theme"],
                      fontSize: 18,
                      fontFamily: "CustomFont"),
                ),
                onTap: () {
                  Navigator.replace(
                    context,
                    oldRoute: ModalRoute.of(context)!,
                    newRoute: MaterialPageRoute(
                        builder: (context) => Utilitycreen(data: data)),
                  );
                },
              )
            : const SizedBox(),
        // ListTile(
        //   leading: const Icon(
        //     Icons.checklist,
        //     size: 26,
        //     color: Colors.black,
        //   ),
        //   title: const Text(
        //     'Critical Parameter',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onTap: () {},
        // ),
        // ListTile(
        //   leading: const Icon(
        //     Icons.checklist,
        //     size: 26,
        //     color: Colors.black,
        //   ),
        //   title: const Text(
        //     'Critical Parameter Trends',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onTap: () {},
        // ),
        // ListTile(
        //   leading: const Icon(
        //     Icons.checklist,
        //     size: 26,
        //     color: Colors.black,
        //   ),
        //   title: const Text(
        //     'Graphical View',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onTap: () {},
        // ),

        // const ListTile(
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Text(
        //         'SETTINGS',
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 18,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // ListTile(
        //   leading: const Icon(
        //     Icons.checklist,
        //     size: 26,
        //     color: Colors.black,
        //   ),
        //   title: const Text(
        //     'Users',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onTap: () {},
        // ),

        // ListTile(
        //   leading: const Icon(
        //     Icons.checklist,
        //     size: 26,
        //     color: Colors.black,
        //   ),
        //   title: const Text(
        //     'Users details',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onTap: () {},
        // ),
        ListTile(
          leading: Icon(
            Icons.logout,
            size: 26,
            color: myColors["theme"],
          ),
          title: Text(
            'Sign out',
            style: TextStyle(
                color: myColors["theme"],
                fontSize: 18,
                fontFamily: "CustomFont"),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Confirm'),
                content: const Text('Do you want to sign out?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.pop(ctx);
                      Navigator.pop(ctx);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    )));
  }
}
