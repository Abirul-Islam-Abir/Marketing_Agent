import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/sales_report_dummy_data.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/filter_btn.dart';
import '../components/list_builder.dart';
import '../controllers/sales_report_screen_controller.dart';

class SalesReportScreenView extends GetView<SalesReportScreenController> {
  const SalesReportScreenView({Key? key}) : super(key: key);

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
                ListBuilder(list: salesReportDataList,)
              ],
            ),
          ),
        ),
      );
}




