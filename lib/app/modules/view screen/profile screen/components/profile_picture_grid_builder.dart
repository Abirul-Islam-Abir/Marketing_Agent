import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/schedule_image_view_screen.dart';


class ProfilePictureGridBuilder extends StatelessWidget {
  const ProfilePictureGridBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
         itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 120),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(() => ScheduleImageViewScreen(img: list[index]['image']));
          },
          child: PictureGridCard(
            image: list[index]['image'],
          ),
        ),
      ),
    );
  }
}