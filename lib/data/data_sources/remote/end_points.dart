// /https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e93441c24e6c4b539e5f03eafed5e841
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// country : eg
// category : business
// apiKey : e93441c24e6c4b539e5f03eafed5e841
// queries : country=eg&category=business&apikey=e93441c24e6c4b539e5f03eafed5e841

class EndPointsManger {
  EndPointsManger._();

  static const String baseUrl = "https://accept.paymob.com/api/";

  static const String AUTH = "auth/tokens";
  static const String ORDER_REGISTRATION = "ecommerce/orders";
  static const String PAYMENT_KEY_REQUEST = "acceptance/payment_keys";
  static const String KIOSK_PAYMENTS= "acceptance/payments/pay";

}
