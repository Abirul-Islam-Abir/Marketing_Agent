import 'package:panara_dialogs/panara_dialogs.dart';

import '../const/export.dart';

class AwesomeDialogs {
  static void showSuccessDialog(context, {desc, okPress}) {
    PanaraInfoDialog.show(
      context,
      title: "Joss!",
      message: desc,
      buttonText: "Okay",
      onTapDismiss: () {
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  static void showErrorDialog(context, {desc}) {
    PanaraInfoDialog.show(
      context,
      textColor: AppColor.kBlackColor,
      title: "Ohh!",

      message: desc,
      buttonText: "Okay",
      onTapDismiss: () {
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }
}
