import 'package:amin_agent/app/data/const/export.dart';

import '../../../widgets/appbar.dart';
import '../components/profile_details_card.dart';
import '../components/profile_details_with_upload_card.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});

  final controller = Get.find<ProfileScreenController>();

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
              UserAvatar('${controller.userProfileList['avatar']}'),
              ProfileDetailsCard(
                  label: 'Name', name: '${controller.userProfileList['name']}'),
              ProfileDetailsCard(
                  label: 'Phone Number',
                  name: '${controller.userProfileList['phone']}'),
              ProfileDetailsCard(
                  label: 'Designation',
                  name: '${controller.userProfileList['designation']}'),
              const ProfileDetailsCard(label: 'Company', name: 'Amin Diagnostic'),
              ProfileDetailsCardWithUpload(
                  showTap: () {},
                  uploadTap: () {},
                  label: 'NID Card',
                  name: '${controller.userProfileList['nid']}'),
              ProfileDetailsCard(
                  label: 'Passport Card',
                  name: '${controller.userProfileList['passport']}'),
              ProfileDetailsCard(
                  label: 'Address',
                  name: '${controller.userProfileList['address']}'),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
