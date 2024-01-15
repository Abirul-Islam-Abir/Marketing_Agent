import '../../../../data/const/export.dart';

class DrawerUpdateCard extends StatelessWidget {
  const DrawerUpdateCard({
    super.key,
    required this.hint,
    required this.label,
  });

  final String hint, label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}