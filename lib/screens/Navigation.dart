import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'HomeScreen.dart';
import 'MyAccountScreen.dart';
import 'PostAdsScreen.dart';
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyAccount(),
    PostAds(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: Colors.lightBlue,
            ),
            label: 'Home',
            activeIcon: Icon(
              Feather.home,
              color: Colors.lightGreenAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.calendar,
              color: Colors.lightBlue,
            ),
            label: ('My Course'),
            activeIcon: Icon(
              FontAwesome.calendar,
              color: Colors.lightGreenAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvilIcons.user,
              color: Colors.lightBlue,
              size: 36,
            ),
            label: ('My Account'),
            activeIcon: Icon(
              EvilIcons.user,
              color: Colors.lightGreenAccent,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
