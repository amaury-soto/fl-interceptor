import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register screen')),
        body: Center(
            child: Center(
              child: Container(
          child: Column(
              children: [Text('Register')],
          ),
        ),
            )));
  }
}
