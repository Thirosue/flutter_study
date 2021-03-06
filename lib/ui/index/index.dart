import 'package:flutter/material.dart';

import '../../model/tab_item.dart';
import '../booking/booking.dart';
import '../holiday/holiday.dart';
import '../settings/settings.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _index = 0;
  PageController _pageController;

  static final List<TabItem> _tabItemList = [
    TabItem('Booking', Booking()),
    TabItem('Holiday', Holiday()),
    TabItem('Settings', Settings()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_tabItemList[_index].title),
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
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
