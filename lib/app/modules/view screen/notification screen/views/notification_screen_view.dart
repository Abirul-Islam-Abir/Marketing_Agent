
import '../../../../data/const/export.dart';


class NotificationScreenView extends StatelessWidget {
  NotificationScreenView({super.key});

  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar(AppString.notification),
      body:  RefreshIndicator(
        onRefresh: () async {
          controller.initializeMethod(1);
        },
        child: GetBuilder<NotificationScreenController>(
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
                              final date = formatDateTime(data[index]
                                      ['created_at'] ??
                                  '01-02-2024 • 01:36 PM');

                              final id = data[index]['id'];
                              final status = data[index]['status'] ?? '';
                              final title = data[index]['title'] ?? '';
                              final description =
                                  data[index]['description'] ?? '';

                              return NotificationCard(
                                  readTap: () {
                                    controller.readNotification(id);
                                  },
                                  isRead: status,
                                  title: '$index$title',
                                  time: date,
                                  desc: description);
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
      ),
    );
  }
}
//new push