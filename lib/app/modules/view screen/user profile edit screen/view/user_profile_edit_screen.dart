import 'package:amin_agent/app/modules/widgets/appbar.dart';
import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';
import 'package:amin_agent/app/modules/widgets/primary_button.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAvatar(
              '${profileController.userProfileList['avatar']}'),
          Expanded(
            child: ListView(
              children: [

                const SizedBox(height: 10),
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
              ],
            ),
          ),
          SecondaryButton(
            text: 'Update',
            onTap: () {},
          ),  const SizedBox(height: 50),
        ],
      ),
    );
  }
}
