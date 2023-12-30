import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String? label;
  String? hint;
  TextInputType? keyboardType;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool isPassword;
  CustomTextField(
      {Key? key,
      this.keyboardType,
      this.label,
      this.hint,
      required this.controller,
      this.validator,
      this.isPassword = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                icon: Icon(
                    obsecureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
