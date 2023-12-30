import 'package:flutter/material.dart';

class CustomAriseTextField extends StatelessWidget {
  final String label;
  String? hint;
  TextInputType? keyboardType;
  TextEditingController controller;
  String? Function(String?)? validator;
  CustomAriseTextField(
      {super.key,
      this.keyboardType,
      required this.label,
      this.hint,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium!.apply(fontWeightDelta: 2),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
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
