import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
/*                 Text(
                  'Find in',
                  style: TextStyle(
                      color:  Color.fromARGB(255, 120, 80, 174),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),  */
                Image(image: AssetImage('assets/logotada.webp'), height: 100, width: 300,)
              ],
            ),
           /*  SizedBox(height: 10), */
           /*  Text(
              'Everything you are looking for by category',
              style: TextStyle(color:  Color.fromARGB(255, 120, 80, 174), fontSize: 16),
            ), */
          ],
        ),
      ),
    );
  }
}
