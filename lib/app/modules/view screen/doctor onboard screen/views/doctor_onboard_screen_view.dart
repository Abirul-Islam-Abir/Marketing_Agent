import 'package:amin_agent/app/modules/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/doctor_onboard_dummy_data.dart';
import '../../../../theme/app_color.dart';
import '../components/listview_builder.dart';
import '../controllers/doctor_onboard_screen_controller.dart';

class DoctorOnboardScreenView extends GetView<DoctorOnboardScreenController> {
  const DoctorOnboardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SecondaryAppBar(text: 'Doctor Onboard'),
                ListViewBuilder(
                  list: doctorOnboardDataList,
                )
              ],
            ),
          ),
        ),
      );
}
