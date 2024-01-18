import '../../../../data/const/export.dart';

class DrawerUpdateCard extends StatelessWidget {
  const DrawerUpdateCard({
    super.key,
    required this.label,   this.controller,
  });

  final String label;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 5,
        minLines: 1,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.all(30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
