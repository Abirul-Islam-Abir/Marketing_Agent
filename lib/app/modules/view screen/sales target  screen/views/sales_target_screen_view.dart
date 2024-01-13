



import '../../../../data/const/export.dart';

class SalesTargetScreenView extends GetView<SalesTargetScreenController> {
  const SalesTargetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SecondaryAppBar(text: 'Targets'),
                ListView.builder(
                  itemCount: salesTargetGroupList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SalesTargetCard(
                      dayLeft: '15 days left',
                      target: salesTargetGroupList[index].target,
                      name: salesTargetGroupList[index].name,
                      progress: salesTargetGroupList[index].progress,
                      completed: salesTargetGroupList[index].completed),
                ),
              ],
            ),
          ),
        ),
      );
}


