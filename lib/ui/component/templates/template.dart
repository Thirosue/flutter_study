import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class Template extends StatelessWidget {
  final int index;
  final Widget child;
  final List<Widget>? actions;

  static final List<List<String>> tabList = [
    [Constants.calendarTitle, Constants.calendar],
    [Constants.holidayTitle, Constants.holiday],
    [Constants.settingTitle, Constants.settings],
  ];

  const Template({
    Key? key,
    required this.child,
    required this.index,
    this.actions,
  }) : super(key: key);

  void move(int index) {
    Get.toNamed(tabList[index].last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(tabList[index].first),
        actions: actions,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Booking'),
              onTap: () => move(0),
            ),
            ListTile(
              leading: const Icon(Icons.cake_outlined),
              title: const Text('Holiday'),
              onTap: () => move(1),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => move(2),
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Booking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cake_outlined), label: 'Holiday'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: index,
        onTap: move,
      ),
    );
  }
}
