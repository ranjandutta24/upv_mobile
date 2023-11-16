import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Container(
                child: Column(
      children: [
        DrawerHeader(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_2_rounded,
                size: 48,
                color: Color.fromARGB(234, 56, 23, 34),
              ),
              SizedBox(width: 18),
              Text(
                'ADMIN',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Overview',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        // const SizedBox(height: 12),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Iron',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'steel/Mills',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Utility',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Critical Parameter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Critical Parameter Trends',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Graphical View',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Digital Dashboard Link',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        const ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Users',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Users details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist,
            size: 26,
            color: Colors.black,
          ),
          title: const Text(
            'Sign out',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          onTap: () {},
        ),
      ],
    ))));
  }
}
