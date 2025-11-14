import 'package:flutter/material.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TripPage')),
      body: const Center(child: Text('This is a StatelessWidget')),
    );
  }
}