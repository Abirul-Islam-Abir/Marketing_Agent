import 'package:flutter/material.dart';

class PictureGridCard extends StatelessWidget {
  const PictureGridCard({
    super.key,
    this.image,
    this.name,
  });

  final String? image, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,
              image: NetworkImage(
                image!,
              ),
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}