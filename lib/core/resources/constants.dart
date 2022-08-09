void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

class Constants {
  static const String PAYMOB_API_KEY = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPakU0TkRVNE5Dd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuMlliaG1kOWVab1NyTDhRR2J5UlQyZzNrOVJ4aGRpR2dLRE5MRUlYakRnRmZ5UzRRZDhLZGI1WmtXbExKU25COVdNNnlLZ3V6MGpQdVFYWmhHOG1BQmc=";
  static String PAYMOB_FIRST_TOKEN = '';
  static String ORDER_ID = '';

  static String FINAL_TOKEN_CARD = '';
  static String FINAL_TOKEN_KIOSK = '';

  static const String INTEGRATION_ID_CARD = "2164418";
  static const String INTEGRATION_ID_KIOSK = "2508205";

  static String REF_CODE = '';
}
