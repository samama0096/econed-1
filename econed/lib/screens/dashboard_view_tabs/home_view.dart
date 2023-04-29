import 'dart:math';

import 'package:econed/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import 'order_view_tabs/show_orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _seletedindex = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getHeader(s),
          Divider(
            indent: s.width * 0.2,
            thickness: 1,
            endIndent: s.width * 0.2,
          ),
          const SizedBox(
            height: 25,
          ),
          getSearchBar(s),
          const SizedBox(
            height: 25,
          ),
          Divider(
            indent: s.width * 0.2,
            thickness: 1,
            endIndent: s.width * 0.2,
          ),
          const SizedBox(
            height: 25,
          ),
          getTabBar(s),
        ],
      ),
    );
  }

  getHeader(Size s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Container(
            height: 120,
            width: s.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.green[400]!,
                  width: 0.5,
                )),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Total Sales :",
                style: TextStyle(fontSize: 26),
              ),
              Text(
                "30,900 Rs.",
                style: TextStyle(fontSize: 26, color: Colors.green[400]!),
              )
            ]),
          ),
        ),
        Container(
          height: 120,
          width: s.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active,
                      size: 35,
                      color: Colors.amber,
                    )),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.green[300],
                        minimumSize: const Size(60, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                    label: const Text("Credit"))
              ]),
        )
      ],
    );
  }

  getSearchBar(Size s) {
    return Container(
      width: s.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 16),
        child: SearchField(
          suggestions: skus.map((e) => SearchFieldListItem("  $e")).toList(),
          suggestionState: Suggestion.expand,
          textInputAction: TextInputAction.next,
          hint: 'Search for best selling SKUs ',
          searchStyle: TextStyle(
            fontSize: 18,
            color: Colors.black.withOpacity(0.8),
          ),
          searchInputDecoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
          maxSuggestionsInViewPort: 6,
          itemHeight: 50,
        ),
      ),
    );
  }

  getTabBar(Size s) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              textColor: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: _seletedindex == 0 ? Colors.grey[300] : Colors.grey[100],
              child: const Text("Orders"),
              onPressed: () {
                setState(() {
                  _seletedindex = 0;
                });
              },
            ),
            MaterialButton(
              textColor: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: _seletedindex == 1 ? Colors.grey[300] : Colors.grey[100],
              child: const Text("Routes"),
              onPressed: () {
                setState(() {
                  _seletedindex = 1;
                });
              },
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: _seletedindex == 0 ? orderTab() : routesTab(s),
        )
      ],
    );
  }
}

Widget orderTab() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Container(
          height: 120,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primarycolor, primarycolor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "You have :",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "307",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Total orders today!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          height: 120,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primarycolor, primarycolor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.live_tv,
                    color: Colors.white,
                  ),
                  Text(
                    "100/119",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "of your SKU's are live!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ]),
          ),
        ),
      ),
    ],
  );
}

Widget routesTab(Size s) {
  List<String> routes = [
    "Bhimber",
    "Barnala",
    "GT-Road",
    "Shadiwal",
    "Shaheen Chowk",
    "GTS-Chowk"
  ];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!)),
        height: s.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, ind) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.grey[200],
                  ),
                );
              },
              itemCount: routes.length,
              itemBuilder: (context, ind) {
                return ListTile(
                  title: Text(
                    routes[ind],
                    style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ShowOrdersView(
                                  route: 2,
                                  routeName: routes[ind],
                                )));
                  },
                  trailing: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          Random().nextInt(15).toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )),
  );
}

List<String> skus = ["SKU-1", "SKU-2", "SKU-3"];
