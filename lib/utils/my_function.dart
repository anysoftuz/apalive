class MyFunction {
  static String convertPhoneNumber(String formattedNumber) {
    return formattedNumber.replaceAll(RegExp(r'[^\d]'), '');
  }

  static String formatDate(String iso) {
    final dt = DateTime.parse(iso).toLocal(); // yoki .toUtc() agar kerak bo'lsa
    final dd = dt.day.toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final yyyy = dt.year.toString();
    return '$dd.$mm.$yyyy';
  }
}
