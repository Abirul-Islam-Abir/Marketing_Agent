// ignore_for_file: deprecated_member_use

import 'package:amin_agent/app/data/const/export.dart';
import 'package:flutter_svg/svg.dart';


Future finisScheduleDialog(context, {img, title, body, yesTap}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.kPrimaryColor.withOpacity(0.20),
            child: SvgPicture.asset(
              img,
              color: AppColor.kPrimaryColor,
              height: 50,
              width: 50,
            )),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: AppColor.kBlackColor),
              ),
              Text(
                body,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,color: AppColor.kBlackColor
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor),
                onPressed: yesTap,
                child: const Text('Yes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor),
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.kWhiteColor),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
Future takePhotoDialog(context, {img, title,  yesTap}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.kPrimaryColor.withOpacity(0.20),
            child: SvgPicture.asset(
              img,
              color: AppColor.kPrimaryColor,
              height: 50,
              width: 50,
            )),
        content: SingleChildScrollView(
          child: Column(   mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: AppColor.kBlackColor),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor),
                onPressed: yesTap,
                child: const Text('Yes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kWhiteColor)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor),
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.kWhiteColor),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}



void addPhotoDialog({cameraTap,galleryTap}) {
  Get.bottomSheet(
    Container(
      height: 250,
      decoration: const BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            height: 5,
            width: 100,
            color: AppColor.kGreyColor,
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add Photo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.kBlackColor),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap:cameraTap ,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: AppColor.kGreyColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Take a photo',
                    style: TextStyle(
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: galleryTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    color: AppColor.kGreyColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Upload from gallary',
                    style: TextStyle(
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
void addCameraPhotoDialog({cameraTap}) {
  Get.bottomSheet(
    Container(
      height: 200,
      decoration: const BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            height: 5,
            width: 100,
            color: AppColor.kGreyColor,
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add Photo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.kBlackColor),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap:cameraTap ,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: AppColor.kGreyColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Take a photo',
                    style: TextStyle(
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}
void completedLocationTaskDialog() {
  Get.dialog(
      barrierDismissible: true,
      Dialog(
        backgroundColor: AppColor.kTransparentColor,
        child: Container(
          height: 300,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Image.asset(
                          'assets/images/Rectangle 51.png',
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: -10,
                          right: 50,
                          left: 50,
                          child: Image.asset(
                            'assets/images/medal.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Congratulations!",
                      style: TextStyle(
                          color: AppColor.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const Text('You completed your this months target.'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 35,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.kPrimaryColor),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: AppColor.kWhiteColor),
                      ),
                    ),
                  )
                ],
              ),
              const AnimateCongratulate(),
            ],
          ),
        ),
      ));
}