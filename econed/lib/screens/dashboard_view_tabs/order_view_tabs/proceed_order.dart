import 'package:econed/models/order_model.dart';
import 'package:econed/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ProceedOrderView extends StatefulWidget {
  const ProceedOrderView({super.key, required this.order, required this.route});
  final Order order;
  final int route;
  @override
  State<ProceedOrderView> createState() => _ProceedOrderViewState();
}

class _ProceedOrderViewState extends State<ProceedOrderView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primarycolor,
          actions: widget.route == 0 || widget.route == 2
              ? [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                        child: Row(
                      children: [
                        const Icon(
                          Icons.history_toggle_off,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "pending...",
                          style: TextStyle(color: Colors.amber[700]),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    )),
                  )
                ]
              : [
                  const Icon(
                    Icons.verified,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
          title: Text(widget.route == 0 || widget.route == 2
              ? "Pending Order #${widget.order.id}"
              : "Accepted Order #${widget.order.id}")),
      body: SizedBox(
        height: s.height * 0.9,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "Retailer Name: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("GK Shop ")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "Retailer Address: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("Ramtalai Chowk Grt... ")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "Contact: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("+92 345 6789009 ")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Area: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("GT Road ")
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black45)),
                              children: const [
                                TableCell(
                                  child: Text(
                                    "Item",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    "Quantity",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TableCell(
                                  child: Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ]),
                          ...widget.order.items
                              .map((e) => TableRow(children: [
                                    TableCell(
                                        child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                    )),
                                    const TableCell(
                                        child: Text(
                                      "10",
                                      textAlign: TextAlign.center,
                                    )),
                                    const TableCell(
                                        child: Text(
                                      "100 Rs.",
                                      textAlign: TextAlign.center,
                                    ))
                                  ]))
                              .toList()
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Payment Details: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("COD ")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Bill: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("Credit "),
                  ],
                ),
              ),
              const Text(
                ".....................................................",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text("900 Rs. ")
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: MaterialButton(
                    color: primarycolor,
                    textColor: Colors.white,
                    child: Text(widget.route == 0 || widget.route == 2
                        ? "Mark as Confirmed"
                        : "Deliver"),
                    onPressed: () {
                      showAlertDialogs(context);
                    }),
              ),
              const Spacer(),
            ]),
      ),
    );
  }

  showAlertDialogs(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
          widget.route == 0 ? "Mark as confirmed?" : "Deliver this order?"),
      content: Text(widget.route == 0 || widget.route == 2
          ? "This will save this order as accepted."
          : "This will mark this order as delivered."),
      actions: [
        MaterialButton(
          onPressed: () {},
          color: Colors.grey,
          textColor: Colors.white,
          child: const Text("Cancel"),
        ),
        MaterialButton(
          onPressed: () {},
          color: primarycolor,
          textColor: Colors.white,
          child: Text(
              widget.route == 0 || widget.route == 2 ? "Accept" : "Deliver"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
