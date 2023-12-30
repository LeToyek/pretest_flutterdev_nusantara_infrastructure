import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  final String label;
  CustomButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.primary),
            child: Center(
                child: Text(
              label,
              style: textTheme.bodyLarge!
                  .apply(fontWeightDelta: 2, color: Colors.white),
            ))));
  }
}
