import '../../../../data/const/export.dart';
import '../../../../model/sales_target_group_model.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({
    super.key, required this.list,
  });
  final List<SalesTargetGroupModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => SalesTargetCard(
          dayLeft: '15 days left',
          target: list[index].target,
          name: list[index].name,
          progress: list[index].progress,
          completed: list[index].completed),
    );
  }
}
