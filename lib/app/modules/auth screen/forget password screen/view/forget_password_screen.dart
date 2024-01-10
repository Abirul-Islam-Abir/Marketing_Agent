import 'package:amin_agent/app/data/utils/const.dart';
import 'package:amin_agent/app/modules/auth%20screen/forget%20password%20screen/controller/forget_password_controller.dart';
import 'package:amin_agent/app/modules/auth%20screen/login%20screen/components/login_button.dart';
import 'package:amin_agent/app/modules/widgets/custom_back_button.dart';
import 'package:amin_agent/app/modules/widgets/login_background_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../widgets/custom_text_field.dart';
import '../../login screen/components/welcome_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final controller = Get.put(ForgetPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBackgroundView(
          image: AppImages.loginScreenBackground,
          child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomBackButton(),
                    SizedBox(height: 15.h),
                    WelcomeText(text: AppString.forgetPassword),
                    const SizedBox(height: 40),
                    CustomTextField(
                        validator: validateMobile,
                        controller: controller.number,
                        hintText: AppString.phone,
                        img: AppImages.textFieldPhone),
                    const SizedBox(height: 40),
                    Obx(() => LoginButton(
                        isProgress: controller.isProgress,
                        onTap: (){controller.validateMethod(context);},
                        text: AppString.continues)),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
