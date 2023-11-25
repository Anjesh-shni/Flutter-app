class DateFormater {
  String formatDate(String dateTime) {
    // Parse the date string into a DateTime object
    var dateUtc = DateTime.now();
    DateTime utcTime = dateUtc.toUtc();

    // Define a format for the desired output
    var correctTime = utcTime.toIso8601String();

    return correctTime;
  }

  String fromUTctoDate(String dateTime) {
    // Parse the date string into a DateTime object
    var dateUtc = DateTime.now();
    DateTime utcTime = dateUtc.toUtc();

    // Define a format for the desired output
    var correctTime = utcTime.toIso8601String();

    return correctTime;
  }

}
