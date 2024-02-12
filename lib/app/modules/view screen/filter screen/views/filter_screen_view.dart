



import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../../../../data/const/export.dart';

class FilterScreenView extends StatelessWidget {
  FilterScreenView({super.key, this.onTap});

  final _controller = Get.put(FilterScreenController());

  final Function()? onTap;
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
                    const FilterText('Filter'),
                    Obx(() => FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PictureAndTargetButton(
                                tap: _controller.selectDateFilter,
                                text: 'Date',
                                backColor: _controller.selectedIndex.value == 0
                                    ? AppColor.kSecondaryColor
                                    : AppColor.kWhiteColor,
                                textColor: _controller.selectedIndex.value == 0
                                    ? AppColor.kWhiteColor
                                    : AppColor.kPrimaryColor,
                              ),
                              const SizedBox(width: 10),
                             /* PictureAndTargetButton(
                                tap: _controller.selectCategoryFilter,
                                text: 'Category',
                                backColor: _controller.selectedIndex.value == 1
                                    ? AppColor.kSecondaryColor
                                    : AppColor.kWhiteColor,
                                textColor: _controller.selectedIndex.value == 1
                                    ? AppColor.kWhiteColor
                                    : AppColor.kPrimaryColor,
                              ),*/
                            ],
                          ),
                        )),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      value: selectedRangeDate,

                      onValueChanged: (dates) {
                        if(dates.length==1){
                          List<DateTime?> duplicatedDate = [dates[0], dates[0]];
                          _controller.onDateChange(duplicatedDate);
                        }else{
                          _controller.onDateChange(dates);
                        }

                      },
                    ),

                    SecondaryButton(
                      isProgress: false,
                        text: 'Filter',
                        onTap: onTap),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} /* Obx(() => _controller.selectedIndex.value == 0
                        ? CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              calendarType: CalendarDatePicker2Type.range,
                            ),
                            value: _controller.selectedDates,
                            onValueChanged: _controller.onDateChange,
                          )
                        : GetBuilder<FilterScreenController>(
                            builder: (_) => GridBuilder())),*/