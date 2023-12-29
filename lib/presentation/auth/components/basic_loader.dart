import 'package:flutter/material.dart';

class BasicLoader extends StatelessWidget {
  const BasicLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 60, width: 60, child: CircularProgressIndicator()));
  }
}
