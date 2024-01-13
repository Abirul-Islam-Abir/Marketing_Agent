


import '../../../../data/const/export.dart';

class TotalSalesScreen extends GetView<TotalSalesScreeenController> {
  const TotalSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SecondaryAppBar(text: 'Sales'),
                ListBuilder(
                  list: salesReportDataList,
                )
              ],
            ),
          ),
        ),
      );
}
