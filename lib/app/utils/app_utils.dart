

import 'package:intl/intl.dart';

const _baseImageUrl = 'https://image.tmdb.org/t/p/w500';

DateFormat formatter = DateFormat('MMMM dd, yyyy');

class AppUtils{
  AppUtils._();

  static String addBaseImageUrl(String part) => _baseImageUrl + part;

  static DateTime parseDateString(String date, {String format = 'yyyy-MM-dd'}) {
    if (format == 'yyyy-MM-dd') {
      return DateTime.parse(date);
    } else {
      DateFormat dateFormat = DateFormat(format);
      return dateFormat.parse(date);
    }
  }

  static String formatDate(DateTime date) => formatter.format(date);



}