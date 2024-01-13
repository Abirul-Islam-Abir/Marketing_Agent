import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.img,
    this.controller,
    this.validator,
    this.icon,
    this.obscureText = false,
    required this.focusNode,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
  });

  final String hintText, img;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool obscureText;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        validator: validator,
        controller: controller,
        textInputAction: textInputAction,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusColor: Colors.green,
          suffixIcon: icon,
          hintText: hintText,
          prefixIcon: Image.asset(
            img,
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
