import 'package:amin_agent/app/modules/widgets/appbar.dart';
import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';

import '../../../../data/const/export.dart';

class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({super.key});

  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile Edit'),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: UserAvatar(
                      '${profileController.userProfileList['avatar']}')),
              const SizedBox(height: 30),
              DrawerUpdateCard(
                  controller: profileController.nameController, label: 'Name'),
              DrawerUpdateCard(
                  controller: profileController.numberController,
                  label: 'Phone Number'),
              DrawerUpdateCard(
                  controller: profileController.designationController,
                  label: 'Designation'),
              DrawerUpdateCard(
                  controller: profileController.companyController,
                  label: 'Company'),
              DrawerUpdateCard(
                  controller: profileController.nidController,
                  label: 'NID Number'),
              DrawerUpdateCard(
                  controller: profileController.addressController,
                  label: 'Location'),
              const SizedBox(height: 30),
              LoginButton(
                text: 'Update',
                onTap: () {},
                isProgress: false,
                color: AppColor.kPrimaryColor,
              ),  const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
