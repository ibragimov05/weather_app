import 'package:intl/intl.dart';

extension ParseStringX on DateTime {
  String get formatDate => DateFormat('MMMM dd').format(this);

  String get formatDateUpdated => DateFormat('MM/dd/yyyy h:mm a').format(this);

  String get formatWithDayName => DateFormat('E d').format(this);
}
