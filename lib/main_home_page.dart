import 'package:flutter/material.dart';
import 'package:furnishop/screens/explore_screen.dart';
import 'package:furnishop/screens/home_screen.dart';
import 'package:furnishop/screens/wishlist_screen.dart';
import 'package:furnishop/styles.dart';

class MainHomePage extends StatefulWidget {
  static int pageIndex = 0;
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List<Widget> _tabList = [
    const HomeScreen(),
    const ExploreScreen(),
    const WishlistScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _tabList[MainHomePage.pageIndex],
        Padding(
          padding: const EdgeInsets.all(24),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              bottom: true,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: whiteColor,
                    unselectedItemColor: greyColor,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    backgroundColor: blackColor,
                    currentIndex: MainHomePage.pageIndex,
                    onTap: (int index) {
                      setState(() {
                        MainHomePage.pageIndex = index;
                      });
                      // ignore: avoid_print
                      print(MainHomePage.pageIndex);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        label: 'Home',
                        icon: SizedBox(
                          child: Icon(
                            Icons.home_rounded,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: 'Explore',
                        icon: Icon(
                          Icons.view_module_rounded,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: 'Favorite',
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: 'Profile',
                        icon: Icon(
                          Icons.person,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
