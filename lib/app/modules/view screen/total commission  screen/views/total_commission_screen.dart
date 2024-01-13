


import '../../../../data/const/export.dart';

class TotalCommissionScreen extends StatelessWidget {
  TotalCommissionScreen({Key? key}) : super(key: key);

  final controller = Get.put(TotalCommissionScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                  const SecondaryAppBar(text: 'Commissions'),
                BuildListViewBuilder(list: commissionDataList),
              ],
            ),
          ),
        ),
      );
}
