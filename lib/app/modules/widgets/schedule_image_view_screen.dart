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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Happy New Year 88',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor,
                        fontSize: 20),
                  ),
                  Text(
                    'Agents: 5',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor,
                        fontSize: 20),
                  ),
                  Text(
                    'Amount Collected: 100000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor,
                        fontSize: 20),
                  ),
                  Text(
                    'Target Amount: 200000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: img,
              child: Image.network(
                '$img',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}