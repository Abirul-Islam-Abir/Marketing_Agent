
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/visit_card.dart';
import 'package:flutter/material.dart';

class VisitAndTargetCard extends StatelessWidget {
  const VisitAndTargetCard({
    super.key,
    required this.visit,
    required this.visitCount,
    required this.target,
    required this.targetCount,
  });

  final String visit, visitCount, target, targetCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VisitCard(text: visit, visitCount: visitCount),
        const SizedBox(
          width: 20,
        ),
        VisitCard(text: target, visitCount: targetCount),
      ],
    );
  }
}