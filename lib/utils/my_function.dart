class MyFunction {
  static String convertPhoneNumber(String formattedNumber) {
    return formattedNumber.replaceAll(RegExp(r'[^\d]'), '');
  }
}
