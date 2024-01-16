import '../../data/const/export.dart';

class SecondaryAppBar extends GetView<TotalCommissionScreenController> {
  const SecondaryAppBar(
     {
    super.key,
    required this.text,required this.filterTap,
  });
  final String text;
  final Function()? filterTap;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: filterTap,

            ),
          ),
        ],
      ),
    );
  }
}
