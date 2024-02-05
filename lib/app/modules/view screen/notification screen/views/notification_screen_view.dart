import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';

class NotificationScreenView extends StatelessWidget {
  NotificationScreenView({super.key});
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar(AppString.notification),
      body: GetBuilder<NotificationScreenController>(
        builder: (_) {
          List data = controller.notificationList;
          return controller.notificationList.isEmpty
              ? const EmptyListText()
              : SizedBox(
                  height: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String formatDateTime(String inputDateTimeString) {
                              // Specify the locale for date and time formats
                              var locale = 'en_US';

                              // Split the input date string into date and time parts
                              List<String> dateTimeParts = inputDateTimeString.split(' • ');

                              // Separate date and time
                              String dateString = dateTimeParts[0];
                              String timeString = dateTimeParts[1];

                              // Define the input date format
                              DateFormat inputDateFormat = DateFormat('MM-dd-yyyy', locale);
                              DateFormat inputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'

                              // Parse date and time separately
                              DateTime date = inputDateFormat.parse(dateString);
                              DateTime time = inputTimeFormat.parse(timeString);

                              // Combine date and time
                              DateTime dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);

                              // Get the current date and time
                              DateTime currentDate = DateTime.now();

                              // Check if it's today
                              if (dateTime.year == currentDate.year &&
                                  dateTime.month == currentDate.month &&
                                  dateTime.day == currentDate.day) {
                                DateFormat outputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'
                                String formattedTime = outputTimeFormat.format(dateTime);
                                return 'today at $formattedTime';
                              }

                              // Check if it's yesterday
                              DateTime yesterday = currentDate.subtract(const Duration(days: 1));
                              if (dateTime.year == yesterday.year &&
                                  dateTime.month == yesterday.month &&
                                  dateTime.day == yesterday.day) {
                                DateFormat outputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'
                                String formattedTime = outputTimeFormat.format(dateTime);
                                return 'yesterday at $formattedTime';
                              }

                              // Default case: use a different date and time format
                              DateFormat outputDateTimeFormat = DateFormat('yyyy-MM-dd h:mm a', locale);  // Change to 'h:mm a'
                              return outputDateTimeFormat.format(dateTime);
                            }



                            final date = formatDateTime(data[index]['created_at'] ??
                                '01-02-2024 • 01:36 PM');

                            final from = data[index]['from'];
                            final id = data[index]['id'];
                            final status = data[index]['status'] ?? '';
                            final title = data[index]['title'] ?? '';
                            final description =
                                data[index]['description'] ?? '';

                            if (index < data.length) {
                              return NotificationCard(
                                readTap: () {
                                  controller.readNotification(
                                    id: id,
                                    nId: from,
                                  );
                                },
                                isRead: status,
                                title: '$index $title',
                                time: date,
                                desc: description,
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                      controller.isProgress
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}