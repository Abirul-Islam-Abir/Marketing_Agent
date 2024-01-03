import 'package:amin_agent/app/data/const/export.dart';


import '../../../../data/dummy data/commission_dummy_data.dart';
import '../components/build_listview_builder.dart';
import '../components/dropdown_button_show.dart';

class CommissionReportScreenView extends StatelessWidget {
  CommissionReportScreenView({Key? key}) : super(key: key);

  final controller = Get.put(CommissionReportScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor, // Replace with your color
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [

              GetBuilder<CommissionReportScreenController>(
                  builder: (controller) => const DropdownButtonShow()),
              BuildListViewBuilder(list: commissionDataList),
            ],
          ),
        ),
      ),
    );
}
