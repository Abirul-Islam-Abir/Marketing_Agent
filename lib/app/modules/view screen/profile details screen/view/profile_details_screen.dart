import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/modules/widgets/pdf_view.dart';

import '../../../widgets/appbar.dart';
 import '../components/profile_details_card.dart';
import '../components/profile_details_with_upload_card.dart';
import '../controller/profile_details_screen_controller.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});
  final _profileController = Get.put(ProfileScreenController());
  final _controller = Get.put(ProfileDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    final data = _profileController.userProfileList;
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAvatar('${data['avatar']}'),
            ProfileDetailsCard(label: 'Name', name: '${data['name']}'),
            ProfileDetailsCard(label: 'Phone Number', name: '${data['phone']}'),
            ProfileDetailsCard(
                label: 'Designation', name: '${data['designation']}'),
            ProfileDetailsCardWithUpload(
                showTap: () {
                  Get.to(() => PdfView(url: data['nid_pdf']));
                },
                uploadTap: _controller.uploadNidFile,
                label: 'NID Card',
                name: '${data['nid']}'),
            ProfileDetailsCardWithUpload(
                showTap: () {
                  Get.to(() => PdfView(url: data['passport_pdf']));
                },
                uploadTap: _controller.uploadPassportFile,
                label: 'Passport Card',
                name: '${data['passport']}'),
            ProfileDetailsCard(label: 'Address', name: '${data['address']}'),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
