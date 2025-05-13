class QuoteService {
  static const double laborRatePerHour = 30.0;
  static const double fuelCharge = 10.0;
  static const double travelCharge = 5.0;

  static double calculateQuote(double estimatedHours) {
    return (estimatedHours * laborRatePerHour) + fuelCharge + travelCharge;
  }

  static String formatQuote(double quoteAmount) {
    return '\$${quoteAmount.toStringAsFixed(2)}';
  }
}
