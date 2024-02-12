import 'package:amin_agent/app/data/const/export.dart';

class PictureGridCard extends StatelessWidget {
  const PictureGridCard({
    super.key,
    this.image,
    this.name, this.time, this.date,
  });

  final String? image, name,time,date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 150,alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image!,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time!,style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kBlueColor),),
                  Text(date!,style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kBlueColor),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}