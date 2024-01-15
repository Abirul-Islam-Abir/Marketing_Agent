import 'package:amin_agent/app/modules/view%20screen/filter%20screen/components/filter_text.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/utils/app decoration.dart';
import '../../../../model/category_model.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/primary_button.dart';
import '../../profile screen/components/picture_and_target_button.dart';
import '../components/grid_builder.dart';
import '../controllers/filter_screen_controller.dart';

class FilterScreenView extends GetView<FilterScreenController> {
  FilterScreenView({Key? key}) : super(key: key);

  final controller = Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kTransparentColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: AppDecoration.roundAllBorderDialog(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FilterText('Filter'),
                    Obx(() => FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PictureAndTargetButton(
                                tap: controller.selectDateFilter,
                                text: 'Date',
                                backColor: controller.selectedIndex.value == 0
                                    ? AppColor.kSecondaryColor
                                    : AppColor.kWhiteColor,
                                textColor: controller.selectedIndex.value == 0
                                    ? AppColor.kWhiteColor
                                    : AppColor.kPrimaryColor,
                              ),
                              SizedBox(width: 10),
                              PictureAndTargetButton(
                                tap: controller.selectCategoryFilter,
                                text: 'Category',
                                backColor: controller.selectedIndex.value == 1
                                    ? AppColor.kSecondaryColor
                                    : AppColor.kWhiteColor,
                                textColor: controller.selectedIndex.value == 1
                                    ? AppColor.kWhiteColor
                                    : AppColor.kPrimaryColor,
                              ),
                            ],
                          ),
                        )),
                    Obx(
                      () => controller.selectedIndex.value == 0
                          ? CalendarDatePicker2(
                              config: CalendarDatePicker2Config(
                                calendarType: CalendarDatePicker2Type.multi,
                              ),
                              value: controller.selectedDates,
                              onValueChanged: controller.onDateChange,
                            )
                          : GetBuilder<FilterScreenController>(
                              builder: (_) => GridBuilder()),
                    ),
                    PrimaryButton(
                        text: 'Filter',
                        onTap: () {
                          controller.setCategory();
                          Get.back();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
