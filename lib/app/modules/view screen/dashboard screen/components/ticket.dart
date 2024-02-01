import '../../../../data/const/export.dart';

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
    required this.targetId,
    required this.userId,
  });

  final String targetId, userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.kYellowColor.withOpacity(0.20),
            border: Border.all(width: 2, color: AppColor.kGreyColor)),
        child: Center(
          child: Text(
            'Token: #T${targetId}A$userId',
            style: const TextStyle(
                color: AppColor.kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}