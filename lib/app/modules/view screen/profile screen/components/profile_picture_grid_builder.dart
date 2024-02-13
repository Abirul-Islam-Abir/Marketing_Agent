import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_grid_card.dart';

class ProfilePictureGridBuilder extends StatelessWidget {
  const ProfilePictureGridBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const EmptyListText()
        : Expanded(
            child: GridView.builder(
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 140),
              itemBuilder: (context, index) {
                return PictureGridCard(
                  name: 'Abir',
                  time: list[index]['time'],
                  date: list[index]['date'],
                  image: list[index]['image'],
                );
              },
            ),
          );
  }
}