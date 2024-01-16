import '../../../../data/const/export.dart';
import '../../../../model/doctor_onboard_model.dart';
import 'doctor_onboard_card.dart';

class OnboardListView extends StatelessWidget {
  const OnboardListView({
    super.key, required this.list,
  });
  final List<DoctorOnboardModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => DoctorOnboardCard(
        location: list[index].name,
        date: list[index].date,
      ),
    );
  }
}