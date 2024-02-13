import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import '../const/export.dart';

List<String> formattedDates = [];
List<DateTime?> selectedDates = [
  DateTime(2000),
  DateTime(2050),
];
List<DateTime?> selectedRangeDate = [DateTime.now()];
String? joinedDates; //using for date filter
String? joinedSelectedDates; //using for date filter
void onDateChange(List<DateTime?> dates) {
  selectedDates = List<DateTime?>.from(dates);
  formattedDates = selectedDates
      .map((date) => DateFormat('yyyy-MM-dd').format(date!))
      .toList();
  // Joining formatted dates with "/"
  joinedDates = formattedDates.join('/');
}

Future<PickedFile> compressImage(String imagePath) async {
  final File imageFile = File(imagePath);
  final img.Image? originalImage = img.decodeImage(imageFile.readAsBytesSync());

  // Resize and encode the image
  final img.Image compressedImage = img.copyResize(originalImage!,
      width: 800, height: 600, interpolation: img.Interpolation.linear);

  final List<int> compressedBytes = img.encodeJpg(compressedImage, quality: 85);

  // Save the compressed image to a new file
  final String compressedImagePath =
      "${imageFile.parent.path}/compressed_${imageFile.uri.pathSegments.last}";
  await File(compressedImagePath).writeAsBytes(compressedBytes);

  return PickedFile(compressedImagePath);
}