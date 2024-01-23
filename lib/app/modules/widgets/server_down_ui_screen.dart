import 'package:amin_agent/app/data/const/export.dart';

class ServerDownScreen extends StatelessWidget {
  const ServerDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Server Down',
                style: TextStyle(
                    fontSize: 50,
                    color: AppColor.kRedColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Image.asset('assets/gif/giphy.gif', fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
