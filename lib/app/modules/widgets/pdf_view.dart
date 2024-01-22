import 'package:amin_agent/app/modules/widgets/appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../data/const/export.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key, required this.url});

  final String url;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  bool isLoadedPdf = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: pdfViewScreenAppbar(
              title: '',
              editTap: () {
                Get.back();
              }),
          body: isLoadedPdf
              ? CircularProgressIndicator()
              : SfPdfViewer.network(onDocumentLoaded: (details) {
                  print('========$details');

                  setState(() {
                    isLoadedPdf = false;
                  });
                }, scrollDirection: PdfScrollDirection.vertical, widget.url)),
    );
  }
}
