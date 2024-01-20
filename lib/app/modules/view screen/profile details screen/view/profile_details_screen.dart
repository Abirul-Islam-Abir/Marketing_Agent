import 'package:amin_agent/app/data/const/export.dart';

import '../../../widgets/appbar.dart';
import '../../profile screen/components/profile_details_card.dart';
import '../../profile screen/components/profile_details_with_upload_card.dart';
import '../controller/profile_details_screen_controller.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});
  final profileController = Get.put(ProfileScreenController());
  final controller = Get.put(ProfileDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile'),
      body: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAvatar('${profileController.userProfileList['avatar']}'),
              ProfileDetailsCard(
                  label: 'Name',
                  name: '${profileController.userProfileList['name']}'),
              ProfileDetailsCard(
                  label: 'Phone Number',
                  name: '${profileController.userProfileList['phone']}'),
              ProfileDetailsCard(
                  label: 'Designation',
                  name: '${profileController.userProfileList['designation']}'),
              ProfileDetailsCardWithUpload(
                  showTap: () {},
                  uploadTap: controller.pickFile,
                  label: 'NID Card',
                  name: '${profileController.userProfileList['nid']}'),
              ProfileDetailsCard(
                  label: 'Passport Card',
                  name: '${profileController.userProfileList['passport']}'),
              ProfileDetailsCard(
                  label: 'Address',
                  name: '${profileController.userProfileList['address']}'),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
