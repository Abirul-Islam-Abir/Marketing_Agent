import 'package:amin_agent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/view screen/greetings_screen/components/animate_congratulate.dart';
import '../../modules/widgets/primary_button.dart';
import '../../theme/app_color.dart';

Future primaryDialog(context, {img, title, body, yesTap}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                body,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor),
            onPressed: yesTap,
            child: const Text('Yes',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.kWhiteColor)),
          ),
          SizedBox(
            width: Get.width / 6,
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
      );
    },
  );
}

void forgotPasswordDialog({title, body, tap}) {
  Get.bottomSheet(
    Container(
      height: 40.h,
      decoration: const BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 5,
              width: 100,
              color: AppColor.kGreyColor,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.kBlackColor),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                body,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColor.kGreyColor),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                      color: AppColor.kBlackColor,
                      fontWeight: FontWeight.normal),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Phone number',
                  disabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(onTap: tap, text: 'Continue'),
          ],
        ),
      ),
    ),
  );
}

void inputVerifyPinDialog() {
  Get.bottomSheet(
    Container(
      height: 40.h,
      decoration: const BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
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
                'Enter 4 digit code',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.kBlackColor),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter the 4 digit code that send to your phone.',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColor.kGreyColor),
              ),
            ),
            const SizedBox(height: 20),
            OTPTextField(
              length: 4,
              width: double.infinity,
              fieldWidth: 50,
              style: const TextStyle(
                  fontSize: 25,
                  color: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.bold),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {},
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Continue',
              onTap: () {
                Get.offAllNamed(RouteName.bottomNav);
              },
            )
          ],
        ),
      ),
    ),
  );
}

void addPhotoDialog() {
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
            onTap: () {},
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
            onTap: () {},
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
                            'assets/images/medal_1498838 1.png',
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
                        Get.offAllNamed(RouteName.bottomNav);
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
