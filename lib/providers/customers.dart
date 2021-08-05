import 'package:flutter/material.dart';

class CustomerItem {
  final String id;
  final String password;

  const CustomerItem({
    @required this.id,
    @required this.password,
  });
}

class Customers with ChangeNotifier {
  List<CustomerItem> _items = [
    CustomerItem(id: 'Bobby', password: "password"),
    CustomerItem(id: 'Timmy', password: "123456"),
    CustomerItem(id: 'Jonny', password: "jonny"),
  ];

  bool successfulLogin(String id, String password) {
    CustomerItem customer = _items.firstWhere((cust) => cust.id == id);
    if (customer != null) {
      if (customer.password == password) {
        return true;
      }
    }
    return false;
  }
}
