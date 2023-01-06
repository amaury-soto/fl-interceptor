import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.sports_bar_outlined,
            text: 'Beers',
          ),
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.liquor_outlined,
            text: 'Liqour',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.store,
            text: 'Stores',
          ),
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.location_on_outlined,
            text: 'Locations',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.local_bar_outlined,
            text: 'Cocktails',
          ),
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.discount_outlined,
            text: 'Offers',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.shopping_bag_outlined,
            text: 'Beers',
          ),
          _SingleCard(
            color: Color.fromARGB(255, 255, 188, 88),
            icon: Icons.support_agent_outlined,
            text: 'Beers',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            //margin: EdgeInsets.all(15),
            height: 160,
            decoration: BoxDecoration(
                color: Color.fromRGBO(62, 66, 105, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon,
                      size: 35, color: Color.fromARGB(255, 120, 80, 174)),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(text, style: TextStyle(color: color, fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
