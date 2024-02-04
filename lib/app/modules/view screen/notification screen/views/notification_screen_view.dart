import 'package:amin_agent/app/api%20services/push%20notification/read_%20notification.dart';
import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';

class NotificationScreenView extends StatelessWidget {
  NotificationScreenView({Key? key}) : super(key: key);
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar(AppString.notification),
      body: GetBuilder<NotificationScreenController>(
        builder: (_) {
          List data = controller.notificationList['data'];
          return controller.isProgress
              ? const ShimmerTargetList()
              : controller.notificationList.isEmpty
                  ? const EmptyListText()
                  : SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.isProgress
                          ? data.length + 1
                          : data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String formatDate(String inputDateTimeString) {
                          DateFormat inputFormat =
                              DateFormat('dd-MM-yyyy • hh:mm a');
                          DateTime dateTime =
                              inputFormat.parse(inputDateTimeString);
                          DateTime currentDate = DateTime.now();
                          if (dateTime.year == currentDate.year &&
                              dateTime.month == currentDate.month &&
                              dateTime.day == currentDate.day) {
                            DateFormat outputTimeFormat =
                                DateFormat('hh:mm a');
                            String formattedTime =
                                outputTimeFormat.format(dateTime);
                            return 'today at $formattedTime';
                          }
                          DateTime yesterday =
                              currentDate.subtract(Duration(days: 1));
                          if (dateTime.year == yesterday.year &&
                              dateTime.month == yesterday.month &&
                              dateTime.day == yesterday.day) {
                            DateFormat outputTimeFormat =
                                DateFormat('hh:mm a');
                            String formattedTime =
                                outputTimeFormat.format(dateTime);
                            return 'yesterday at $formattedTime';
                          }
                          DateFormat outputDateTimeFormat =
                              DateFormat('yyyy-MM-dd HH:mm:ss');
                          return outputDateTimeFormat.format(dateTime);
                        }
                        final from = data[index]['from'];
                        final id = data[index]['id'];
                        final status = data[index]['status'] ?? '';
                        final title = data[index]['title'] ?? '';
                        final date =
                            formatDate(data[index]['created_at'] ?? '');
                        final description =
                            data[index]['description'] ?? '';
                        if (index < data.length) {
                          return NotificationCard(
                            readTap: () {
                              controller.readNotification(
                                  id: id, nId: from);
                            },
                            isRead: status,
                            title: title,
                            time: date,
                            desc: description,
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  );
        },
      ),
    );
  }
}