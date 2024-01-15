// ignore_for_file: file_names

import '../const/export.dart';

class AppDecoration {
  static BoxDecoration buildBottomDecoration() {
    return BoxDecoration(
      color: AppColor.kWhiteColor,
      boxShadow: [
        BoxShadow(
          color: AppColor.kBlackColor.withOpacity(0.3), // Shadow color
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // Changes the position of the shadow
        ),
      ],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    );
  }
static BoxDecoration roundAllBorderDialog(){
    return BoxDecoration(
      color: AppColor.kWhiteColor,
      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
      borderRadius: BorderRadius.circular(20),
    );
}
  AppDecoration._();
}
List<BoxShadow>? shadow =  [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 3,
    blurRadius: 5,
    offset: const Offset(
        0, 3), // changes position of shadow
  ),
];