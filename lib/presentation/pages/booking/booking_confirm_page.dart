import 'package:flutter/material.dart';

class BookingConfirmPage extends StatefulWidget {
  const BookingConfirmPage({super.key});

  @override
  State<BookingConfirmPage> createState() => _BookingConfirmPageState();
}

class _BookingConfirmPageState extends State<BookingConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BookingConfirmPage')),
      body: const Center(child: Text('This is a StatefulWidget')),
    );
  }
}