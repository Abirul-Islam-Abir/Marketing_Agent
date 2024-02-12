import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/controllers/dashboard_screen_controller.dart';
import 'package:data_table_2/data_table_2.dart';

import '../../../../data/const/export.dart';

class DataTable2SimpleDemo extends StatelessWidget {
  DataTable2SimpleDemo({super.key});

  final controller = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.kSecondaryColor,border: Border.all(width: 02,color:AppColor.kGreyColor)
          ),
          child: DataTable2(
            columnSpacing: 10,
            horizontalMargin: 10,
            columns: [
              DataColumn(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: AppColor.kWhiteColor),
                  ),
                ),
              ),
              DataColumn(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Progress',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: AppColor.kWhiteColor),
                  ),
                ),
              ),
            ],
            rows: controller.pieChart.map((item) {
              return DataRow(cells: [
                DataCell(
                  Text(item["agent_name"] ?? "",style: TextStyle(color: AppColor.kWhiteColor),),
                ),
                DataCell(
                  Text(item["sell_amount"].toString() ?? "",style: TextStyle(color: AppColor.kWhiteColor)),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}