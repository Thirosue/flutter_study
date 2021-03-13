import 'package:flutter/material.dart';

import '../../model/tab_item.dart';
import '../booking/booking_page.dart';
import '../holiday/holiday_page.dart';
import '../settings/setting_page.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _index = 0;
  PageController _pageController = PageController(initialPage: 0);

  static final List<TabItem> _tabItemList = [
    TabItem('Booking', BookingPage()),
    TabItem('Holiday', HolidayPage()),
    TabItem('Settings', SettingPage()),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _openPage(int index, BuildContext context) {
    if (index != _index) {
      _animateToPage(index);
    }
    Navigator.pop(context);
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
        automaticallyImplyLeading: false,
        title: Text(_tabItemList[_index].title),
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
              onTap: () => _openPage(0, context),
            ),
            ListTile(
              leading: const Icon(Icons.cake_outlined),
              title: const Text('Holiday'),
              onTap: () => _openPage(1, context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _openPage(2, context),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _tabItemList.map((e) => e.widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Booking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cake_outlined), label: 'Holiday'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _index,
        onTap: (index) {
          _index = index;
          _animateToPage(index);
        },
      ),
    );
  }
}
