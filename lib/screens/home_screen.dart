import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_interceptor/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Column(
            children: [
              Text('TaDa Home'),
            ],
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            key: key,
            backgroundColor: Colors.deepPurple,
            closeButtonStyle: const ExpandableFabCloseButtonStyle(
                backgroundColor: Colors.deepPurple),
            type: ExpandableFabType.up,
            overlayStyle: ExpandableFabOverlayStyle(blur: 5),
            children: [
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.add_reaction_outlined),
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
              ),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.search),
                backgroundColor: Colors.deepPurple,
                onPressed: () {},
              ),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.logout),
                backgroundColor: Colors.deepPurple,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
