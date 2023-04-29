import 'package:flutter/material.dart';

getCustomDrawer(Size s) {
  return Drawer(
    child: Column(children: [
      SizedBox(
        height: s.height * 0.1,
      ),
      SizedBox(
        height: 100,
        width: double.infinity,
        child: Image.asset(
          "lib/assets/2.png",
          fit: BoxFit.cover,
        ),
      ),
      const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.white),
          currentAccountPicture: Icon(
            Icons.photo_size_select_large_rounded,
            size: 50,
          ),
          accountName: Text("Samama Majeed"),
          accountEmail: Text("samama0096@gmail.com")),
      const ListTile(
        title: Text("Orders"),
        leading: Icon(Icons.format_list_bulleted_add),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
      const ListTile(
        title: Text("Reports"),
        leading: Icon(Icons.receipt_long_rounded),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
      const ListTile(
        title: Text("Products"),
        leading: Icon(Icons.view_list),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
      const ListTile(
        title: Text("Store"),
        leading: Icon(Icons.store),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
      const Divider(),
      const Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.exit_to_app_rounded),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    ]),
  );
}
