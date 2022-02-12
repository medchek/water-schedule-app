class TimeFormatter {
  static String _addZeroToSingleDigitNumber(int n) =>
      n < 10 ? '0$n' : n.toString();
  static String fromat(int? hours, int? minutes) {
    final int m = minutes ?? 0;
    final int h = hours ?? 0;
    return "${_addZeroToSingleDigitNumber(h)}:${_addZeroToSingleDigitNumber(m)}";
  }
}
