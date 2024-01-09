import '../const/export.dart';

class AwesomeDialogs {
  static void showSuccessDialog({desc, okPress}) {
    Get.dialog(
      AlertDialog(
        title: const Text('Success'),
        content: Text(desc),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void showErrorDialog({desc}) {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Something went wrong!',
          style:
              TextStyle(color: AppColor.kRedColor, fontWeight: FontWeight.bold,fontSize: 16),
        ),
        content: Text(desc),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
