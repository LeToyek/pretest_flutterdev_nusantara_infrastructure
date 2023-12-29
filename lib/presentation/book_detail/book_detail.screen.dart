import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/book_detail.controller.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookDetailScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookDetailScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
