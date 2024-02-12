import 'package:amin_agent/app/data/const/export.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(''),
      body: Center(
        child: Hero(
          tag: img,
          child: CircularProfileAvatar(
            img,
             borderColor: Colors.purpleAccent,
            borderWidth: 10,
            elevation: 10,
            radius: MediaQuery.of(context).size.width/2.3,imageFit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}