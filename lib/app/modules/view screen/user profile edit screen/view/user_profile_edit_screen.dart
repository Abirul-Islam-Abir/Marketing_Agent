import 'package:amin_agent/app/modules/widgets/appbar.dart';
import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';
import 'package:amin_agent/app/modules/widgets/primary_button.dart';

import '../../../../api services/auth/update_profile.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';
import '../controller/user_profile_edit_screen_controller.dart';

class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({super.key});

  final profileController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile Edit'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAvatar('${profileController.userProfileList['avatar']}'),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                DrawerUpdateCard(
                    controller: profileController.nameController,
                    label: 'Name'),
                DrawerUpdateCard(
                    readOnly: true,
                    controller: profileController.numberController,
                    label: 'Phone Number'),
                DrawerUpdateCard(
                    controller: profileController.designationController,
                    label: 'Designation'),
                DrawerUpdateCard(
                    controller: profileController.passportController,
                    label: 'Passport Number'),
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
          Obx(() => SecondaryButton(
                isProgress: profileController.isProgress,
                text: 'Update',
                onTap: profileController.userProfileEdit,
              )),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
