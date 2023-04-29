class Order {
  final String id;
  final List<String> items;
  final int qnt;
  final int status;

  Order({
    required this.id,
    required this.items,
    required this.qnt,
    required this.status,
  });
}

// if status==0 then order is pending, if status==1, order is accepted, if status==2, order is delivered and if status==-1, order is cancelled.

//only for ui purpose
class OrderRepo {
  static List<Order> orders = [
    Order(id: "0988", items: ["Panadol", "Disprin"], qnt: 10, status: 0),
    Order(id: "0989", items: ["Panadol", "Disprin"], qnt: 11, status: 0),
    Order(id: "0990", items: ["Panadol", "Disprin"], qnt: 187, status: 0),
    Order(id: "0991", items: ["Panadol", "Disprin"], qnt: 135, status: 0),
    Order(id: "0992", items: ["Panadol", "Disprin"], qnt: 8, status: 0),
    Order(id: "0993", items: ["Panadol", "Disprin"], qnt: 25, status: 0),
    Order(id: "0994", items: ["Panadol", "Disprin"], qnt: 77, status: 0)
  ];
}
