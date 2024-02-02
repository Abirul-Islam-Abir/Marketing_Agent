import '../../../../data/const/export.dart';

class DrawerUpdateCard extends StatelessWidget {
  const DrawerUpdateCard({
    super.key,
    required this.label,  required this.controller,   this.readOnly = false,this.filled=false, this.onEditingComplete,
  });

  final String label;
final TextEditingController controller;
final bool readOnly;
final bool filled;
final  void Function()?  onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly:readOnly ,
        onEditingComplete: onEditingComplete,
        maxLines: 3,
        minLines: 1,
textInputAction: TextInputAction.next,        controller: controller,
        decoration: InputDecoration(filled: filled,
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