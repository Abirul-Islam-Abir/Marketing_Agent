import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../data/const/export.dart';

class AvatarLoadingSpinKit extends StatelessWidget {
  const AvatarLoadingSpinKit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 60,
        backgroundColor: AppColor.kTransparentColor,
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}