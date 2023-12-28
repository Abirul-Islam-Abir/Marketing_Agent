
import 'package:flutter/material.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({
    super.key,
    required this.text,
    required this.visitCount,
  });

  final String text, visitCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,style: const TextStyle(color: Colors.black54),),
          Text(
            visitCount,
            style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
          ),
        ],
      ),
    );
  }
}