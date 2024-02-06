import 'package:intl/intl.dart';

String formatDateTime(String inputDateTimeString) {
  // Specify the locale for date and time formats
  var locale = 'en_US';

  // Split the input date string into date and time parts
  List<String> dateTimeParts = inputDateTimeString.split(' • ');

  // Separate date and time
  String dateString = dateTimeParts[0];
  String timeString = dateTimeParts[1];

  // Define the input date format
  DateFormat inputDateFormat = DateFormat('MM-dd-yyyy', locale);
  DateFormat inputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'

  // Parse date and time separately
  DateTime date = inputDateFormat.parse(dateString);
  DateTime time = inputTimeFormat.parse(timeString);

  // Combine date and time
  DateTime dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);

  // Get the current date and time
  DateTime currentDate = DateTime.now();

  // Check if it's today
  if (dateTime.year == currentDate.year &&
      dateTime.month == currentDate.month &&
      dateTime.day == currentDate.day) {
    DateFormat outputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'
    String formattedTime = outputTimeFormat.format(dateTime);
    return 'today at $formattedTime';
  }

  // Check if it's yesterday
  DateTime yesterday = currentDate.subtract(const Duration(days: 1));
  if (dateTime.year == yesterday.year &&
      dateTime.month == yesterday.month &&
      dateTime.day == yesterday.day) {
    DateFormat outputTimeFormat = DateFormat('h:mm a', locale);  // Change to 'h:mm a'
    String formattedTime = outputTimeFormat.format(dateTime);
    return 'yesterday at $formattedTime';
  }

  // Default case: use a different date and time format
  DateFormat outputDateTimeFormat = DateFormat('yyyy-MM-dd h:mm a', locale);  // Change to 'h:mm a'
  return outputDateTimeFormat.format(dateTime);
}