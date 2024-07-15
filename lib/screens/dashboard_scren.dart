import 'package:event_spotter/screens/news_list.dart';
import 'package:event_spotter/screens/inbox_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:event_spotter/screens/home_scren.dart';
import 'package:event_spotter/screens/my_profile_screen.dart';
import 'package:event_spotter/utils/colors.dart';
import 'search_screen.dart';

class DashedBoardScreen extends StatefulWidget {
  const DashedBoardScreen({super.key, this.selectedScreen});
  final String? selectedScreen;
  @override
  State<DashedBoardScreen> createState() => _DashedBoardScreenState();
}

class _DashedBoardScreenState extends State<DashedBoardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
    if (widget.selectedScreen != null) {
      if (widget.selectedScreen == 'inbox') {
        setState(() {
          _selectedIndex = 3;
        });
      } else if (widget.selectedScreen == 'news') {
        setState(() {
          _selectedIndex = 2;
        });
      }
    }

    _pages.add(const HomeScreen());
    _pages.add(const SearchScreen());
    _pages.add(const NewsList());
    _pages.add(const InboxScreen());
    _pages.add(const ProfileScreen());
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor1,
      unselectedItemColor: black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(LineIcons.copy, size: 28), label: ''),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.search, size: 28), label: ''),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.newspaper, size: 28), label: ''),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.user_friends, size: 28), label: ''),
        BottomNavigationBarItem(
            icon: Icon(LineIcons.user, size: 28), label: ''),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
