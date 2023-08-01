class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'http://84.201.179.226:5000/api';

  static const String imagesUrl = 'http://84.201.179.226:5000';

  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  static const Duration connectionTimeout = Duration(milliseconds: 5000);

  static const String auth = '/auth';

  static const String users = '/users';

  static const String products = '/products';

  static const String manufacturers = '/manufacturers';

  static const String models = '/models';

  static const String purchases = '/purchases';
}
