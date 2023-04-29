import 'package:econed/models/order_model.dart';
import 'package:econed/screens/dashboard_view_tabs/order_view_tabs/show_orders_view.dart';
import 'package:econed/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  bool isSelectedItem = false;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: s.height,
        child: Column(children: [
          Column(children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Order Statistics",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: getHeaderBtn(
                        70,
                        s.width * 0.3,
                        "Accepted ",
                        "109",
                        primarycolor.withOpacity(0.6),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ShowOrdersView(route: 1)));
                      },
                    ),
                    VerticalDivider(
                      indent: 20,
                      thickness: 1,
                      color: Colors.grey[400],
                      width: 1,
                      endIndent: 20,
                    ),
                    getHeaderBtn(70, s.width * 0.3, "Cancelled ", "5",
                        Colors.red.withOpacity(0.3))
                  ],
                ),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getHeaderBtn(70, s.width * 0.3, "Pending ", "19",
                      Colors.yellow[900]!.withOpacity(0.4)),
                  VerticalDivider(
                    indent: 20,
                    thickness: 1,
                    color: Colors.grey[400],
                    width: 1,
                    endIndent: 20,
                  ),
                  getHeaderBtn(70, s.width * 0.3, "Delivered ", "15",
                      Colors.blue.withOpacity(0.4))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ShowOrdersView(route: 0)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: getHeaderBtn(70, s.width * 0.75, "Total Orders ", "135",
                    Colors.grey.withOpacity(0.4)),
              ),
            ),
            Divider(
              indent: s.width * 0.2,
              thickness: 1,
              endIndent: s.width * 0.2,
            ),
          ]),
          const Text(
            "Order Requests",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
              // height: s.height * 0.3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: OrderRepo.orders.length,
                  itemBuilder: (context, ind) {
                    return ListTile(
                      leading: Icon(
                        Icons.image,
                        color: primarycolor,
                      ),
                      trailing: PopupMenuButton(
                          onSelected: (v) {},
                          itemBuilder: (
                            context,
                          ) {
                            return [
                              PopupMenuItem(
                                value: "ac",
                                child: Text(
                                  "Accept",
                                  style: TextStyle(color: Colors.green[600]),
                                ),
                              ),
                              PopupMenuItem(
                                value: "dc",
                                child: Text(
                                  "Decline",
                                  style: TextStyle(color: Colors.red[900]),
                                ),
                              )
                            ];
                          }),
                      title: Text("Order #${OrderRepo.orders[ind].id} "),
                      subtitle: Text("${OrderRepo.orders[ind].items[0]} ...."
                          .toLowerCase()),
                    );
                  })),
          Divider(
            indent: s.width * 0.2,
            thickness: 1,
            endIndent: s.width * 0.2,
          ),
        ]),
      ),
    );
  }
}

getHeaderBtn(double h, double w, String title, String count, Color c) {
  return Container(
    decoration:
        BoxDecoration(color: c, borderRadius: BorderRadius.circular(20)),
    height: h,
    width: w,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      Text(count),
    ]),
  );
}
