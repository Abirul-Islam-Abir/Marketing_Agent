import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../data/const/export.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SfPdfViewer.network(
              scrollDirection: PdfScrollDirection.vertical,
              url)),
    );
  }
}