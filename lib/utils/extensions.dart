import 'package:intl/intl.dart';
import 'package:triveous_news/utils/constants.dart';

extension NewCategoryEnumParser on NewsCategory {
  String newsCategory({bool needLowerCase = false}) {
    final word = this.toString().split('.').last;
    return needLowerCase ? word : word[0].toUpperCase() + word.substring(1);
  }
}

extension DateTimeParser on String {
  String getFormattedLocalDateTime() {
    return DateFormat('yMMMd').add_jm().format(DateTime.parse(this).toLocal());
  }
}
