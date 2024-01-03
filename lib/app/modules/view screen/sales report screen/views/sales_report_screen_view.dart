import 'package:amin_agent/app/modules/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/commission_dummy_data.dart';
import '../../../../data/dummy data/sales_report_dummy_data.dart';
import '../../../../model/sales_model.dart';
import '../../../../theme/app_color.dart';
import '../../commission report screen/components/build_listview_builder.dart';
import '../../commission report screen/components/commission_report_card.dart';
import '../../commission report screen/components/dropdown_button_show.dart';
import '../../commission report screen/controllers/commission_report_screen_controller.dart';
import '../../../widgets/filter_btn.dart';
import '../components/list_builder.dart';
import '../components/sales_report_card.dart';
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




