
import '../../../../data/const/export.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});

  final _controller = Get.put(ProfileDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: updateScreenAppbar(
          title: 'Profile',
          editTap: () {
            Get.to(() => UserProfileEditScreen());
          }),
      body: GetBuilder<ProfileScreenController>(
        builder: (controller) {
          final data = controller.userProfileList;
          return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserAvatar(
                    '${data['avatar']}',
                  ),
                  ProfileDetailsCard(label: 'Name', name: '${data['name']}'),
                  ProfileDetailsCard(
                      label: 'Phone Number', name: '${data['phone']}'),
                  ProfileDetailsCard(
                      label: 'Designation', name: '${data['designation']}'),
                  GetBuilder<ProfileDetailsScreenController>(
                      builder: (controller) => ProfileDetailsCardWithUpload(
                          isUpload: controller.isNid,
                          showTap: () {
                            if (data['nid_pdf'] != '') {
                              Get.to(() => PdfView(url: data['nid_pdf']));
                            } else {
                              AppSnackbar.pdfNotUploaded();
                            }
                          },
                          uploadTap: _controller.uploadNidFile,
                          label: 'NID Card',
                          name: '${data['nid']}')),
                  GetBuilder<ProfileDetailsScreenController>(
                      builder: (controller) {
                    return ProfileDetailsCardWithUpload(
                        isUpload: controller.isPassport,
                        showTap: () {
                          if (data['passport_pdf'] != '') {
                            Get.to(() => PdfView(url: data['passport_pdf']));
                          } else {
                            AppSnackbar.pdfNotUploaded();
                          }
                        },
                        uploadTap: _controller.uploadPassportFile,
                        label: 'Passport Card',
                        name: '${data['passport']}');
                  }),
                  ProfileDetailsCard(
                      label: 'Address', name: '${data['address']}'),
                ]),
          );
        },
      ),
    );
  }
}