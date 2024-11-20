import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Screens/iron_page.dart';
import 'package:in.iisco.upv/Screens/log_page2.dart';
import 'package:in.iisco.upv/Screens/overview_page.dart';
import 'package:in.iisco.upv/Screens/steel_mills_page.dart';
import 'package:in.iisco.upv/Screens/utility_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';
import 'package:in.iisco.upv/providers/user.dart';
import 'package:google_fonts/google_fonts.dart';

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
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/OIP.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black
                .withOpacity(0.5), // Add a semi-transparent dark overlay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.perm_identity_rounded,
                  size: 40,
                  color: Color.fromARGB(234, 254, 254, 254),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      "${data["firstname"]} ${data["lastname"] ?? ""}",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "${data["role"]}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: "CustomFont",
                    color: Color.fromARGB(255, 245, 234, 140),
                  ),
                )
              ],
            ),
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
                  builder: (context) => const OverviewScreen()),
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
                    onPressed: () async {
                      await deleteAllUsersData();
                      Navigator.popUntil(context, (route) => route.isFirst);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
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

  Future<void> deleteAllUsersData() async {
    final db = await getDatabase();

    // Delete all rows from the 'users_data' table
    await db.delete('user_collections');
    // await db.delete('users_data');
    // await db.delete('organization_data');
    // await db.delete('academic_data');

    // Alternatively, you can use the raw SQL query to achieve the same
    // await db.rawDelete('DELETE FROM users_data');

    await db.close();
  }
}
