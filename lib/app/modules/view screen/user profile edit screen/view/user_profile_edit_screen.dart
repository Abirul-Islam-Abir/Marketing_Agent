import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';

import '../../../../data/const/export.dart';

// UserProfileEditScreen is a StatelessWidget for editing user profile information.
class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({super.key});

  // Create an instance of ProfileScreenController using GetX and put it into the GetX dependency injection system
  final _controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    // Get the user profile data from the controller
    final data = _controller.userProfileList;

    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      // Build the app bar with a title
      appBar: buildNavigateAppbar('Profile Edit'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Display the user avatar using the UserAvatar widget
            UserAvatar('${data['avatar']}'),
            const SizedBox(height: 10),
            // DrawerUpdateCard is a custom widget for updating profile information with a text field
            DrawerUpdateCard(
                controller: _controller.nameController,
                label: 'Name'),
            DrawerUpdateCard(
                readOnly: true,
                controller: _controller.numberController,
                label: 'Phone Number'),
            DrawerUpdateCard(
                controller: _controller.designationController,
                label: 'Designation'),
            DrawerUpdateCard(
                controller: _controller.passportController,
                label: 'Passport Number'),
            DrawerUpdateCard(
                controller: _controller.nidController,
                label: 'NID Number'),
            DrawerUpdateCard(
                controller: _controller.addressController,
                label: 'Location'),
            const SizedBox(height: 30),
            // Obx is a GetX widget that rebuilds when the observable value changes
            GetBuilder<ProfileScreenController>(builder: (controller) => SecondaryButton(
                isProgress: controller.isProgress,
                text: 'Update',
                onTap: _controller.userProfileEdit,
              )),
          ],
        ),
      ),
    );
  }
}

