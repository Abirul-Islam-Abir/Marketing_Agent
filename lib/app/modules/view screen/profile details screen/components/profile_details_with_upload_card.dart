import '../../../../data/const/export.dart';

class ProfileDetailsCardWithUpload extends StatelessWidget {
  const ProfileDetailsCardWithUpload(
      {super.key,
      required this.name,
      required this.label,
      required this.showTap,
      required this.uploadTap,
      required this.isUpload});

  final String name, label;
  final Function() showTap, uploadTap;
  final bool isUpload;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            AppColor.kSecondaryColor,
            AppColor.kPrimaryColor,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.kWhiteColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColor.kWhiteColor),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: showTap,
                          icon: const Icon(
                            Icons.remove_red_eye,
                            color: AppColor.kWhiteColor,
                          )),
                      const SizedBox(width: 5),
                      isUpload
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColor.kWhiteColor,
                            ))
                          : IconButton(
                              onPressed: uploadTap,
                              icon: const Icon(
                                Icons.cloud_upload,
                                color: AppColor.kWhiteColor,
                              ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}