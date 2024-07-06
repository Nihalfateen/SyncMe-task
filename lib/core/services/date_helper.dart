import 'package:intl/intl.dart';

extension FormattedDateString on String {
  String toCustomDateFormat() {
    try {
      // Parse the string to a DateTime object
      DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS");
      DateTime dateTime = inputFormat.parse(this);

      // Format the DateTime object to a custom string format
      DateFormat outputFormat = DateFormat('d MMM yyyy');
      return outputFormat.format(dateTime);
    } catch (e) {
      // If parsing or formatting fails, return an error message or the original string
      return "Invalid date format";
    }
  }
}