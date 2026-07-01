import 'package:flutter/material.dart';
import 'package:sport_shop/feature/home/home.dart';
import 'package:sport_shop/feature/profile/profile.dart';
import 'package:sport_shop/feature/settings/settings.dart';
import 'package:sport_shop/feature/shop/shop.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _Page = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: _Page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _Page,
        onTap: (index) => {
          this._pageController.animateToPage(
            index,
            duration: Duration(microseconds: 500),
            curve: Curves.easeInOut,
          ),
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "home",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shop",
          ),

          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newpage) {
          setState(() {
            this._Page = newpage;
          });
        },
        children: [
          HomeScreen(),
          shopscreen(),
          profilescreen(),
          Settingsscreen(),
        ],
      ),
    );
  }
}

////////////////////////////// widget method///////////////////////////////
///////////////////////////////////////////////////////////////////////////

singleChild({required String title, required IconData icon}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 60), SizedBox(height: 20), Text(title)],
    ),
  );
}
