import 'package:amin_agent/app/data/const/export.dart';

import '../../../../data/dummy data/commission_dummy_data.dart';
import '../../../widgets/secondary_appbar.dart';
import '../components/build_listview_builder.dart';
 import '../controllers/commission_report_screen_controller.dart';

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
                  const SecondaryAppBar(text: 'Total Commission'),
                BuildListViewBuilder(list: commissionDataList),
              ],
            ),
          ),
        ),
      );
}
