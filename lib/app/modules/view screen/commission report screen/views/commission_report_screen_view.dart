import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/model/commission_model.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/dummy data/commission_dummy_data.dart';
import '../components/build_listview_builder.dart';
import '../components/commission_report_card.dart';
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
                  builder: (controller) => DropdownButtonShow()),
              BuildListViewBuilder(list: commissionDataList),
            ],
          ),
        ),
      ),
    );
}
