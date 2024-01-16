import 'package:amin_agent/app/model/notification_model.dart';

import '../../../../data/const/export.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({
    super.key, required this.list,
  });
  final List<NotificationModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => NotificationCard(time:list[index].time ,day: list[index].day,
           data: list[index].data,),
    );
  }
}
