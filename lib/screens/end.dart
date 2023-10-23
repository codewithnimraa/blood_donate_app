import 'package:flutter/material.dart';

class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.water_drop,
            color: Colors.white,
            
          ),
          backgroundColor: Colors.red,
          title: const Text(
            "ZINDAGI",
            textAlign: TextAlign.right,
          ),
        ),
        body: Center(
          child: Text(
            "THANKS FOR DONATION",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.red),
          ), 
        ),
        );
  }
}
