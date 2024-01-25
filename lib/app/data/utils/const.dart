String? validatePassword(String? value) {
  // RegExp regex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  var passNonNullValue = value ?? "";
  if (passNonNullValue.isEmpty) {
    return ("Password is required");
  } else if (passNonNullValue.length < 6) {
    return ("Password Must be more than 5 characters");
    // } else if (!regex.hasMatch(passNonNullValue)) {
    //   return ("Password should contain upper,lower,digit and Special character ");
  } else if (passNonNullValue.length > 15) {
    return ("Password max 15  characters");
    // } else if (!regex.hasMatch(passNonNullValue)) {
    //   return ("Password should contain upper,lower,digit and Special character ");
  }
  return null;
}

String? validateMobile(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
