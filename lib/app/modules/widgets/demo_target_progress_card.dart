import '../../data/const/export.dart';

class DemoTargetProgressCard extends StatelessWidget {
  const DemoTargetProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurrentTargetProgressCard(
      isCurrent: false,
      onTap: () async {},
      text: 'There is no target',
      progress: '0.0',
      agentsCount: 0,
      amountCollected: '0.0',
      targetAmount: '0.0',
    );
  }
}