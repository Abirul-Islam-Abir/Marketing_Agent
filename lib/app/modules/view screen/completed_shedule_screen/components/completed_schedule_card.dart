import 'package:flutter_svg/svg.dart';

import '../../../../data/const/export.dart';

class CompletedScheduleCard extends StatelessWidget {
  const CompletedScheduleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.sendTap,
  });

  final String title, subtitle, image;
  final Function()? sendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 8, left: 5),
      child: Container(
        height: 120,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),

        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kBlackColor,fontSize: 15
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kBlackColor,fontSize: 13),
              maxLines: 1,
            ),
          ),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image),
          ),
          trailing: FittedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,width: 10,),
                const SizedBox(width: 5),
                InkWell(
                  onTap: sendTap,
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColor.kPrimaryColor,
                      child: SvgPicture.asset('assets/svg/Vector.svg')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}