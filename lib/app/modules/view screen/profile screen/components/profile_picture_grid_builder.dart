import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePictureGridBuilder extends StatelessWidget {
  const ProfilePictureGridBuilder({
    super.key, required this.list,
  });
final List list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 0.8,
      height: list.length * 80,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 140),
        itemBuilder: (context, index) =>
            PictureGridCard(image: list[index].image),
      ),
    );
  }
}
