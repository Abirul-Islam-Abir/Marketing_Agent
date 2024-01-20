import 'package:amin_agent/app/data/const/export.dart';

import '../../../widgets/appbar.dart';
import '../components/profile_details_card.dart';
import '../components/profile_details_with_upload_card.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key, required this.userList});

 final Map userList;

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
              UserAvatar('${userList['avatar']}'),
              ProfileDetailsCard(
                  label: 'Name', name: '${userList['name']}'),
              ProfileDetailsCard(
                  label: 'Phone Number',
                  name: '${userList['phone']}'),
              ProfileDetailsCard(
                  label: 'Designation',
                  name: '${userList['designation']}'),
              const ProfileDetailsCard(label: 'Company', name: 'Amin Diagnostic'),
              ProfileDetailsCardWithUpload(
                  showTap: () {},
                  uploadTap: () {},
                  label: 'NID Card',
                  name: '${userList['nid']}'),
              ProfileDetailsCard(
                  label: 'Passport Card',
                  name: '${userList['passport']}'),
              ProfileDetailsCard(
                  label: 'Address',
                  name: '${userList['address']}'),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
