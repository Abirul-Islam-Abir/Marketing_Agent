import '../../../../data/const/export.dart';
import '../../../../model/category_model.dart';
import '../controllers/filter_screen_controller.dart';

class GridBuilder extends StatelessWidget {
  GridBuilder({
    super.key,

  });
  final controller = Get.put(FilterScreenController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: Get.height / 2.5,
        child: GridView.builder(
          itemCount: controller.userList.length,
          shrinkWrap: true,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 40,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            User user =
            controller.userList[index];
            controller.isSelected =
                controller.selectedUserIndex ==
                    index;

            return GestureDetector(
              onTap: () {
                controller
                    .selectedChangeIndex(index);
                controller.category = user.name!;
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                    AppColor.kSecondaryColor,
                    width:
                    2.0, // Border width for the selected container
                  ),
                  borderRadius:
                  BorderRadius.circular(10),
                  color: controller.isSelected
                      ? AppColor.kSecondaryColor
                      : AppColor.kWhiteColor,
                ),
                child: Text(
                  user.name ?? '',
                  style: TextStyle(
                    color: controller.isSelected
                        ? AppColor.kWhiteColor
                        : AppColor.kPrimaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}