

import '../../../../data/const/export.dart';

class DoctorOnboardScreenView extends GetView<DoctorOnboardScreenController> {
  const DoctorOnboardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SecondaryAppBar(text: 'Doctor Onboard'),
                ListViewBuilder(
                  list: doctorOnboardDataList,
                )
              ],
            ),
          ),
        ),
      );
}
