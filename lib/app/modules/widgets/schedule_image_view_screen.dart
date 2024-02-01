import 'package:amin_agent/app/data/const/export.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class ScheduleImageViewScreen extends StatelessWidget {
  const ScheduleImageViewScreen({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(''),
      body: Center(
        child: Hero(
          tag: img,
          child: Image.network(
            '$img', fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}