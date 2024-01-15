import 'package:amin_agent/app/data/const/export.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    required this.keyboardType,
    required this.textInputAction,
    this.onFieldSubmitted,
  });

  final String hintText, img;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool obscureText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        style: TextStyle(color: AppColor.kWhiteColor, fontSize: 18.sp),
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        validator: validator,
        controller: controller,
        textInputAction: textInputAction,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: AppColor.kWhiteColor),
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
