import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, this.onChanged, required this.img, this.controller, this.validator,
  });
  final String hintText,img;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String?  Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusColor: Colors.green,

            hintText: hintText,
            hintStyle: const TextStyle(color: AppColor.kWhiteColor),
            prefixIcon: Image.asset(img),
      ),),
    );
  }
}