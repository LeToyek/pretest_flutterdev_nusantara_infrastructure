import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogWidget extends StatelessWidget {
  String? title;
  final String description;
  void Function()? onConfirm;

  CustomDialogWidget({
    super.key,
    this.title,
    required this.description,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "Peringatan"),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: Get.back,
          child: const Text('Tidak'),
        ),
        TextButton(onPressed: onConfirm, child: const Text('Ya')),
      ],
    );
  }
}
