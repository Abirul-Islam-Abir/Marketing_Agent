
   import '../../data/const/export.dart';

class SecondaryAppBar extends GetView<TotalCommissionScreenController> {
  const SecondaryAppBar( {super.key, required this.text,

  });
final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.kWhiteColor),
          ),

       /*   GetBuilder<TotalCommissionScreenController>(builder: (_) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                iconStyleData:
                const IconStyleData(iconEnabledColor: Colors.white),
                isExpanded: false,
                hint: const Text(
                  'Choose',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor),
                ),
                items: controller.items
                    .map(
                      (String item) =>
                      DropdownMenuItem<String>(
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
            );
          }),
         */


          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
