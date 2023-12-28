import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/dummy data/profile_picture_dummy_data.dart';

class ProfilePictureGridBuilder extends StatelessWidget {
  const ProfilePictureGridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 0.8,
      height: pictureDummyData.length * 80,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pictureDummyData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 140),
        itemBuilder: (context, index) =>
            PictureGridCard(image: pictureDummyData[index].image),
      ),
    );
  }
}


