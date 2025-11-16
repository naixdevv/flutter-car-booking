import 'package:flutter/material.dart';

class BookingSearchResultPage extends StatefulWidget {
  const BookingSearchResultPage({super.key});

  @override
  State<BookingSearchResultPage> createState() => _BookingSearchResultPageState();
}

class _BookingSearchResultPageState extends State<BookingSearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BookingSearchResultPage')),
      body: const Center(child: Text('This is a StatefulWidget')),
    );
  }
}