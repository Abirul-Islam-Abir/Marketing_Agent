
import '../../data/const/export.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.filter_alt_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}