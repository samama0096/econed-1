import 'package:econed/screens/dashboard_view.dart';
import 'package:econed/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: primarycolor, // status bar color
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primarycolor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primarycolor),
    ),
    home: const DashboardView(),
  ));
}
