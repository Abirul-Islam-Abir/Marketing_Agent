import 'package:amin_agent/app/data/const/export.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.img});
final String img;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: buildNavigateAppbar('Image'),
      body: SizedBox(height: double.infinity,width: double.infinity,child: Hero(
          tag:'$img' ,
          child: Image.network(img,fit: BoxFit.fill,)),),
    );
  }
}