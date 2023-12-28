import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/visit_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/dummy data/profile_target_data_list.dart';

class ProfileTargetListviewBuilder extends StatelessWidget {
  const ProfileTargetListviewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: profileTargetList.length * 200,
      width: Get.width/ 0.8,
      child: ListView.builder(
        itemCount: profileTargetList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => VisitDoctorCard(
            text: profileTargetList[index].visitDoctor,
            doneCount: profileTargetList[index].doneDay,
            daysCount: profileTargetList[index].time,
            progress: profileTargetList[index].progress),
      ),
    );
  }
}
