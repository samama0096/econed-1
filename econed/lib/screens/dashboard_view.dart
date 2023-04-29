import 'package:econed/screens/dashboard_view_tabs/listing_view.dart';
import 'package:econed/screens/dashboard_view_tabs/orders_view.dart';
import 'package:econed/screens/dashboard_view_tabs/profile_view.dart';
import 'package:econed/screens/dashboard_view_tabs/upload_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'dashboard_view_tabs/custom_drawer.dart';
import 'dashboard_view_tabs/home_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> tabs = const [
    HomeView(),
    OrdersView(),
    UploadView(),
    ListingView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      drawer: getCustomDrawer(s),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[400],
        title: Text(
          _selectedIndex == 0
              ? "Dashboard"
              : _selectedIndex == 1
                  ? "Orders"
                  : _selectedIndex == 2
                      ? "New Order"
                      : _selectedIndex == 3
                          ? "Listings"
                          : "My Profile",
        ),
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: GNav(
              tabActiveBorder:
                  Border.all(color: Colors.green[400]!, width: 0.5),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              activeColor: Colors.green[400],
              iconSize: 30,
              gap: 5,
              padding: const EdgeInsets.all(8),
              duration: const Duration(microseconds: 10),
              curve: Curves.easeInOut,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              //     color: MyColors.textC.withOpacity(0.4),
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home ',
                ),
                GButton(
                  icon: Icons.format_list_bulleted_add,
                  text: 'Orders',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'New ',
                ),
                GButton(
                  icon: Icons.list_rounded,
                  text: 'Listing ',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )),
      ),
    );
  }
}
