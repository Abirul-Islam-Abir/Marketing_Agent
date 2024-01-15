import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';

import '../../../../data/const/export.dart';

class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({super.key});

  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                UserAvatar('${profileController.userProfileList['avatar']}'),
                const SizedBox(height: 30),
                DrawerUpdateCard(
                    hint: '${profileController.userProfileList['name']}',
                    label: 'John Doe'),
                DrawerUpdateCard(
                    hint: '${profileController.userProfileList['name']}',
                    label: 'John Doe'),
                const DrawerUpdateCard(
                    hint: '01722734871', label: 'Phone Number'),
                DrawerUpdateCard(
                    hint: '${profileController.userProfileList['designation']}',
                    label: 'Designation'),
                const DrawerUpdateCard(
                    hint: 'Company', label: 'Amin Diagnostics'),
                const DrawerUpdateCard(
                    hint: '124578945124', label: 'NID Number'),
                const DrawerUpdateCard(hint: 'Uttara,Dhaka', label: 'Location'),
                const SizedBox(height: 30),
                LoginButton(
                  text: 'Update',
                  onTap: () {},
                  isProgress: false,
                  color: AppColor.kPrimaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
