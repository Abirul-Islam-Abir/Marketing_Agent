import '../../../../data/const/export.dart';

void showCtScanList(BuildContext context) async {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
  Overlay.of(context).context.findRenderObject() as RenderBox;
  final Rect position = Rect.fromPoints(
    button.localToGlobal(Offset.zero, ancestor: overlay),
    button.localToGlobal(button.size.bottomLeft(Offset.zero),
        ancestor: overlay),
  );

  final selected = await showMenu<String>(
    context: context,
    position: RelativeRect.fromRect(position, Offset.zero & overlay.size),
    items: Get.find<CommissionReportScreenController>()
        .ctScanList
        .map((String item) {
      return PopupMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList(),
  );

  if (selected != null) {
    // Handle the selected value if needed
  }
}