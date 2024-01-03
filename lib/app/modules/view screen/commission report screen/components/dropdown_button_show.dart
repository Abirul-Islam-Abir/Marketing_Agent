import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class DropdownButtonShow extends GetView<CommissionReportScreenController> {
  const DropdownButtonShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width/ 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData: IconStyleData(iconEnabledColor: Colors.white),
              isExpanded: false,
              hint: Text(
                'Choose',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kWhiteColor),
              ),
              items: controller.items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              )
                  .toList(),
              value: controller.selectedValue,
              onChanged: (v) {
                controller.valueUpdate(v, context);
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}