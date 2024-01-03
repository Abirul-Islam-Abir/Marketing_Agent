import 'package:amin_agent/app/data/dummy%20data/sales_target_group_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme/app_color.dart';
import '../../../widgets/filter_btn.dart';
import '../controllers/sales_target_group_screen_controller.dart';

class SalesTargetGroupScreenView
    extends GetView<SalesTargetGroupScreenController> {
  const SalesTargetGroupScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [

                const FilterButton(),
                ListView.builder(
                  itemCount: salesTargetGroupList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SalesTargetGroupCard(
                      target:  salesTargetGroupList[index].target,
                      name:salesTargetGroupList[index].name,
                      progress: salesTargetGroupList[index].progress,
                      completed: salesTargetGroupList[index].completed),
                ),
              ],
            ),
          ),
        ),
      );
}

class SalesTargetGroupCard extends StatelessWidget {
  const SalesTargetGroupCard({
    super.key,
    required this.name,
    required this.target,
    required this.completed,
    required this.progress,
  });

  final String name, target, completed;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Text(
              '$completed/$target',
              style: const TextStyle(
                  color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  border: Border.all(width: 2, color: AppColor.kWhiteColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => Container(
                        width: constraints.maxWidth * progress,
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
