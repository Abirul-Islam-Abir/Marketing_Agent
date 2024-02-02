import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';
 class NotificationScreenView extends StatelessWidget {
  NotificationScreenView({Key? key}) : super(key: key);
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(AppString.notification),
      body: GetBuilder<NotificationScreenController>(
        builder: (_) {
          final data = controller.notificationList['data'];
          return controller.isProgress
              ? const ShimmerTargetList()
              : controller.notificationList.isEmpty
                  ? const EmptyListText()
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.initializeMethod();
                      },
                      child: SizedBox(
                        height: double.infinity,
                        child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String formatDate(String inputDateTimeString) {
                              // Define the input format
                              DateFormat inputFormat =
                                  DateFormat('dd-MM-yyyy • hh:mm a');
                              // Parse the input string to a DateTime object
                              DateTime dateTime =
                                  inputFormat.parse(inputDateTimeString);
                              // Get the current date
                              DateTime currentDate = DateTime.now();
                              // Check if the date is today
                              if (dateTime.year == currentDate.year &&
                                  dateTime.month == currentDate.month &&
                                  dateTime.day == currentDate.day) {
                                // If it's today, return "today" and the formatted time
                                DateFormat outputTimeFormat =
                                    DateFormat('hh:mm a');
                                String formattedTime =
                                    outputTimeFormat.format(dateTime);
                                return 'today at $formattedTime';
                              }
                              // Check if the date is yesterday
                              DateTime yesterday =
                                  currentDate.subtract(Duration(days: 1));
                              if (dateTime.year == yesterday.year &&
                                  dateTime.month == yesterday.month &&
                                  dateTime.day == yesterday.day) {
                                // If it's yesterday, return "yesterday" and the formatted time
                                DateFormat outputTimeFormat =
                                    DateFormat('hh:mm a');
                                String formattedTime =
                                    outputTimeFormat.format(dateTime);
                                return 'yesterday at $formattedTime';
                              }

                              // If it's neither today nor yesterday, return the formatted date and time
                              DateFormat outputDateTimeFormat =
                                  DateFormat('yyyy-MM-dd HH:mm:ss');
                              return outputDateTimeFormat.format(dateTime);
                            }

                            return NotificationCard(
                              isRead: data[index]['status'] ?? 'read',
                              title: data[index]['title'] ?? '',
                              time: formatDate(data[index]['created_at'] ?? ''),
                              data: data[index]['description'] ?? '',
                            );
                          },
                        ),
                      ),
                    );
        },
      ),
    );
  }
}