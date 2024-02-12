import 'package:upgrader/upgrader.dart';

import '../../../../data/const/export.dart';

class UpdateAvailable extends StatelessWidget {
  const UpdateAvailable(
      {super.key,
        required this.child,
        required this.isUpdate,
        this.packageName});

  final Widget child;
  final bool isUpdate;
  final String? packageName;

  void launchPlayStore() async {
    String playStoreUrl = '$packageName';
    final uri = Uri.parse(playStoreUrl);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      shouldPopScope: () {
        return false;
      },
      onUpdate: () {
        launchPlayStore();
        return true;
      },
      canDismissDialog: true,
      upgrader: Upgrader(
        debugDisplayAlways: isUpdate,
        debugLogging: true,
        debugDisplayOnce: false,
        durationUntilAlertAgain: const Duration(seconds: 5),
        countryCode: '+880',
      ),
      child: child,
    );
  }
}