import 'package:amin_agent/app/modules/view%20screen/total%20commission%20%20screen/views/total_commission_details_screen.dart';

import '../../../../data/const/export.dart';
import '../components/total_commission_card.dart';

class TotalCommissionScreen extends StatelessWidget {
  const TotalCommissionScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(
     'Commissions',
          ),
      body: SizedBox( height: double.infinity,
        child: ListView.builder(
          itemCount: commissionDataList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => TotalCommissionCard(
            location: commissionDataList[index].location,
            target: commissionDataList[index].target,
            date: '01/12/2024',
            sendTap: () {
              Get.to(TotalCommissionDetailsScreen(commissionDataList));
            },
          ),
        ),
      ));
}