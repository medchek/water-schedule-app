class PeriodInfoInterface {
  final String text;
  final bool isWaterUnavailable;

  PeriodInfoInterface({
    required this.text,
    this.isWaterUnavailable = false,
  });
}
