import 'package:app/Components/CustomListChat.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/Home.dart';
import 'package:app/veiws/ListVeiwChat.dart';
import 'package:app/veiws/MarketForUser.dart';
import 'package:app/veiws/profile.dart';

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  int _currentIndex = 0;

  final List<Widget> _pages = [
   Home(),
     const MarketForUser(),
   const LIstViewChat(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 0
                    ? const Color(0xffD2ECEA)
                    : Colors.transparent,
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 0 ? Colors.white : Colors.transparent,
                ),
                padding: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == 0 ? PrimaryColor : Colors.transparent,
                  ),
                  padding: EdgeInsets.all(12),
                  child: _currentIndex == 0
                      ? Image.asset("assets/icons/clarity_home-line (2).png")
                      : Image.asset("assets/icons/clarity_home-line (1).png"),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == 1 ? Color(0xffD2ECEA) : Colors.transparent,
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 1 ? Colors.white : Colors.transparent,
                ),
                padding: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == 1 ? PrimaryColor : Colors.transparent,
                  ),
                  padding: EdgeInsets.all(12),
                  child: _currentIndex == 1
                      ? Image.asset("assets/icons/Vector (5).png")
                      : Image.asset("assets/icons/Vector (4).png"),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == 2 ? Color(0xffD2ECEA) : Colors.transparent,
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 2 ? Colors.white : Colors.transparent,
                ),
                padding: EdgeInsets.all(2),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 2
                          ? PrimaryColor
                          : Colors.transparent,
                    ),
                    padding: EdgeInsets.all(12),
                    child: _currentIndex == 2
                        ? Image.asset("assets/icons/Group (2).png")
                        : Image.asset("assets/icons/Group (1).png")),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 3
                    ? const Color(0xffD2ECEA)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 3 ? Colors.white : Colors.transparent,
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == 3
                          ? PrimaryColor
                          : Colors.transparent,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: _currentIndex == 3
                        ? Image.asset(
                            "assets/icons/healthicons_market-stall-outline (1).png")
                        : Image.asset("assets/icons/carbon_user-profile.png")),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}