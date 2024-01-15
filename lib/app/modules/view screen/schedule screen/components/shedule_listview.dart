import '../../../../data/const/export.dart';
import '../../../../model/schedule_models.dart';
import 'schedule_card.dart';

class SheduleListView extends StatelessWidget {
  const SheduleListView({
    super.key, required this.list,
  });
  final List<Pharmacy> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ScheduleCard(
        sendTap: () {
          Get.toNamed(RouteName.mapScreen);
        },
        doneTap: () {
          primaryDialog(context,
              img: AppImages.doneIcon,
              title: 'Are you sure?',
              body: 'This visit is done!',
              yesTap: completedLocationTaskDialog);
        },
        image: list[index].imageUrl,
        subtitle: list[index].subtitle,
        title: list[index].title,
      ),
    );
  }
}