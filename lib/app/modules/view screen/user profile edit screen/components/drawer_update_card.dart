import '../../../../data/const/export.dart';

class DrawerUpdateCard extends StatelessWidget {
  const DrawerUpdateCard({
    super.key,
    required this.label,  required this.controller,   this.readOnly = false,
  });

  final String label;
final TextEditingController controller;
final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly:readOnly ,
        maxLines: 3,
        minLines: 1,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
