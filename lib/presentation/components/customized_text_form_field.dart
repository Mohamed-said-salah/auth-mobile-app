import 'package:flutter/material.dart';

class CustomizedTextFormField extends StatelessWidget {
  final String labelName;
  final bool? isEnabled;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool visiblePassword;
  final TextInputType? keyboardType;
  const CustomizedTextFormField({
    super.key,
    required this.labelName,
    this.isEnabled,
    this.suffixIcon,
    required this.controller,
    this.visiblePassword = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: visiblePassword,
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          // Done: input field decoration [border, default string].
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          labelText: labelName,
          labelStyle: isEnabled == true
              ? null
              : const TextStyle(
                  color: Colors.black,
                ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
