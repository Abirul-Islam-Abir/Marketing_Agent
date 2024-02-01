import 'package:amin_agent/app/data/const/export.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('About MPO'),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to MPO - Your Location Companion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'MPO is more than just a location tracking app; it\'s your reliable companion for seamless navigation, safety, and connectivity.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Key Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FeatureBulletPoint(text: 'Real-time Location Sharing'),
            FeatureBulletPoint(text: 'Smart Geofencing'),
            FeatureBulletPoint(text: 'Route History'),
            FeatureBulletPoint(text: 'SOS Emergency Alerts'),
            FeatureBulletPoint(text: 'Privacy Controls'),
            SizedBox(height: 20),
            Text(
              'With MPO, you can stay connected, safe, and in control of your location data. Download MPO now and make every journey a secure and connected experience!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }


}

class FeatureBulletPoint extends StatelessWidget {
  final String text;

  const FeatureBulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}