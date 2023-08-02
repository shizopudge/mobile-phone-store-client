class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://130.193.52.158:5000/api';

  static const String imagesUrl = 'https://130.193.52.158:5000';

  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  static const Duration connectionTimeout = Duration(milliseconds: 5000);

  static const String auth = '/auth';

  static const String users = '/users';

  static const String products = '/products';

  static const String manufacturers = '/manufacturers';

  static const String models = '/models';

  static const String purchases = '/purchases';
}
