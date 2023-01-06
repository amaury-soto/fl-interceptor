import 'package:flutter/material.dart';
import 'package:flutter_interceptor/widgets/background1.dart';
import 'package:flutter_interceptor/widgets/card_table.dart';
import 'package:flutter_interceptor/widgets/custom_bottom_navigator.dart';
import 'package:flutter_interceptor/widgets/page_title.dart';

class TadaHomeScreen extends StatelessWidget {
  const TadaHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigator(),
        body: Stack(
        
      children: [Background1(), _HomeBody()],

    ));
    
    // bottomNavigationBar: CustomBottomNavigator());
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Allow scroll if child is more big
    return SingleChildScrollView(
      child: Column(
        children: [
          //Titles
          PageTitle(),
          CardTable()
        ],
      ),
    );
  }
}
