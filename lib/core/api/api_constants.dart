class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'http://192.168.42.246:5000/api';

  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  static const Duration connectionTimeout = Duration(milliseconds: 5000);

  static const String auth = '/auth';

  static const String users = '/users';
}
