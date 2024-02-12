import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';
import 'package:flutter/material.dart';



class ProfilePictureGridBuilder extends StatelessWidget {
  const ProfilePictureGridBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
         itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 140  ),
        itemBuilder: (context, index) {
          // Extracting date from completion_timestamp
          String completionTimestamp = list[index]['completion_timestamp'];
          String date = completionTimestamp.substring(completionTimestamp.indexOf('•') + 1).trim();
          List<String> parts = completionTimestamp.split(' ');
          String timePart = parts[0]; // Extracting the time part
          String amPmPart = parts.length > 1 ? parts[1] : ''; // Extracting the AM/PM part if exists

          // Check if AM/PM is missing and append it if needed
          if (!timePart.contains('AM') && !timePart.contains('PM')) {
            // Assuming that if AM/PM is missing, it's in 24-hour format
            // You may need more sophisticated logic if the format varies
            int hour = int.parse(timePart.split(':')[0]);
            amPmPart = hour < 12 ? 'AM' : 'PM';
            timePart = '$timePart $amPmPart'; // Appending AM/PM
          }

          return PictureGridCard(
          name: 'Abir',
          time: timePart,
          date: date,
          image: list[index]['image'],
        );
        },
      ),
    );
  }
}