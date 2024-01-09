import 'package:amin_agent/app/modules/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/sales_report_dummy_data.dart';
import '../../../../theme/app_color.dart';
 import '../components/list_builder.dart';
import '../controllers/total_sales_screen_controller.dart';

class TotalSalesScreen extends GetView<TotalSalesScreeenController> {
  const TotalSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SecondaryAppBar(text: 'Total Sales'),
                ListBuilder(
                  list: salesReportDataList,
                )
              ],
            ),
          ),
        ),
      );
}
