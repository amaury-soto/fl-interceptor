import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(55, 57, 84, 0.9),
      selectedItemColor: Color.fromARGB(255, 255, 188, 88),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 1,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.sports_bar_outlined), label: 'Beers'),
      BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Delivery'),
      BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
    ]);
  }
}
