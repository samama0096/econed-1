import 'package:econed/screens/dashboard_view_tabs/order_view_tabs/proceed_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';
import '../../../utils/app_constants.dart';

class ShowOrdersView extends StatefulWidget {
  ShowOrdersView({super.key, required this.route, this.routeName});
  final int route;
  String? routeName;
  @override
  State<ShowOrdersView> createState() => _ShowOrdersViewState();
}

class _ShowOrdersViewState extends State<ShowOrdersView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          widget.route == 0
              ? "All Orders"
              : widget.route == 1
                  ? "Accepted Orders"
                  : widget.routeName!.toString(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            child: widget.route == 0
                ? getAllOrderList(s)
                : widget.route == 1
                    ? getAcceptedOrderList(s)
                    : getFilterByRouteOrderList(s),
          ),
        ],
      ),
    );
  }
}

getAllOrderList(s) {
  return SizedBox(
      height: s.height * 0.8,
      child: ListView.separated(
          separatorBuilder: (context, i) {
            return Divider(
              indent: s.width * 0.2,
              thickness: 1,
              endIndent: s.width * 0.2,
            );
          },
          physics: const BouncingScrollPhysics(),
          itemCount: OrderRepo.orders.length,
          itemBuilder: (context, ind) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProceedOrderView(
                              order: OrderRepo.orders[ind],
                              route: 0,
                            )));
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: Icon(
                Icons.image,
                color: primarycolor.withOpacity(0.7),
              ),
              title: Text("Order #${OrderRepo.orders[ind].id} "),
              subtitle:
                  Text("${OrderRepo.orders[ind].items[0]} ....".toLowerCase()),
            );
          }));
}

getAcceptedOrderList(s) {
  return SizedBox(
      height: s.height * 0.8,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: OrderRepo.orders.length,
          itemBuilder: (context, ind) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProceedOrderView(
                              order: OrderRepo.orders[ind],
                              route: 1,
                            )));
              },
              leading: Icon(
                Icons.image,
                color: primarycolor,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              title: Text("Order #${OrderRepo.orders[ind].id} "),
              subtitle:
                  Text("${OrderRepo.orders[ind].items[0]} ....".toLowerCase()),
            );
          }));
}

getFilterByRouteOrderList(s) {
  return SizedBox(
      height: s.height * 0.8,
      child: ListView.separated(
          separatorBuilder: (context, i) {
            return Divider(
              indent: s.width * 0.2,
              thickness: 1,
              endIndent: s.width * 0.2,
            );
          },
          physics: const BouncingScrollPhysics(),
          itemCount: OrderRepo.orders.length,
          itemBuilder: (context, ind) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProceedOrderView(
                              order: OrderRepo.orders[ind],
                              route: 2,
                            )));
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: Icon(
                Icons.image,
                color: primarycolor.withOpacity(0.7),
              ),
              title: Text("Order #${OrderRepo.orders[ind].id} "),
              subtitle:
                  Text("${OrderRepo.orders[ind].items[0]} ....".toLowerCase()),
            );
          }));
}
