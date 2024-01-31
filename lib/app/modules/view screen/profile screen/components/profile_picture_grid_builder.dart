import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';
import 'package:amin_agent/app/modules/widgets/image_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/profile_picture_model.dart';

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
            crossAxisCount: 3, mainAxisExtent: 140),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(() => ImageViewScreen(img: list[index]['image']));
          },
          child: PictureGridCard(
            image: list[index]['image'],
          ),
        ),
      ),
    );
  }
}