import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, this.onChanged, required this.img,
  });
  final String hintText,img;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(onChanged: onChanged,
        decoration: InputDecoration(
          focusColor: Colors.green,

            hintText: hintText,
            hintStyle: const TextStyle(color: AppColor.kWhiteColor),
            prefixIcon: Image.asset(img),
      ),),
    );
  }
}