import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/doctor_onboard_dummy_data.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/appbar.dart';
import '../../dashboard screen/components/sales_targeted_dashboard_progress_card.dart';
import '../../doctor onboard screen/components/doctor_onboard_card.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../controllers/all_targets_screen_controller.dart';

class AllTargetsScreenView extends GetView<AllTargetsScreenController> {
  const AllTargetsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildFilterAppBar(
            text: 'All Targets',
            filterTap: () {
              Get.dialog(FilterScreenView());
            }),
        body:  ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) =>  SalesTargetedProgressCard(
              onTap: () {
                Get.toNamed(RouteName.salesTargetScreen);
              },
              text: 'Sales Target',
              progress: '0.5',
              collaborate: 5,
              totalCompletedSales: '10,00,000',
              totalSales: '5,00,000'),
        )
    );
  }
}
