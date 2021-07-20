part of common;

const String FORMAT_YYYY_MM_DD = 'yyyy-MM-dd';
const String FORMAT_HH_MM = 'hh:mm aa';

extension DateTimeExtension on DateTime {
  String getFormattedDate(String format) {
    final dateFormat = new DateFormat(format);
    return dateFormat.format(this);
  }
}
