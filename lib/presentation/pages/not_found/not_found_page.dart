import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NotFoundPage')),
      body: const Center(child: Text('This is a StatelessWidget')),
    );
  }
}