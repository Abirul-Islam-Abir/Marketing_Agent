import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../data/const/export.dart';

// Import your color file

class PdfView extends StatefulWidget {
  final String url;

  const PdfView({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  late PDFDocument doc;
  late Future<PDFDocument> pdfFuture;

  @override
  void initState() {
    super.initState();
    pdfFuture = pdf(); // Call the pdf method to load the PDF document
  }

  Future<PDFDocument> pdf() async {
    return await PDFDocument.fromURL(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: pdfViewScreenAppbar(
        title: '',
        editTap: () {
          Get.back();
        },
      ),
      body: Center(
        child: FutureBuilder(
          future: pdfFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for the PDF to load
              return const Center(
                child: SpinKitThreeInOut(
                  color: Colors.blue, // Set the color of the spinner
                  size: 50.0, // Set the size of the spinner
                ),
              );
            } else if (snapshot.hasError) {
              // Handle error if any
              return const Center(
                child: SpinKitThreeInOut(
                  color: Colors.blue, // Set the color of the spinner
                  size: 50.0, // Set the size of the spinner
                ),
              );
            } else {
              // Show the PDF viewer once it is loaded
              doc = snapshot.data as PDFDocument;
              return PDFViewer(
                progressIndicator: const Center(
                  child: SpinKitThreeInOut(
                    color: Colors.blue, // Set the color of the spinner
                    size: 50.0, // Set the size of the spinner
                  ),
                ),
                document: doc,
                backgroundColor: AppColor.kWhiteColor,
                indicatorBackground: AppColor.kPrimaryColor,
                indicatorText: AppColor.kWhiteColor,
                showIndicator: true,
                showPicker: true,
              );
            }
          },
        ),
      ),
    );
  }
}
