import '../../data/const/export.dart';

class EmptyListText extends StatelessWidget {
  const EmptyListText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          'Empty List',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.kOrangeColor),
        ));
  }
}