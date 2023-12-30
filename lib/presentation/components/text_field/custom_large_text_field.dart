import 'package:flutter/material.dart';

class CustomLargeTextField extends StatelessWidget {
  final String label;
  String? hint;
  TextEditingController controller;
  String? Function(String?)? validator;
  CustomLargeTextField(
      {super.key,
      required this.label,
      this.hint,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(fontWeightDelta: 2),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          maxLines: 10,
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: TextDirection.ltr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
