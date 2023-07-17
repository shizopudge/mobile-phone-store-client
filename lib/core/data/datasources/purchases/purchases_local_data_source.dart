import 'package:url_launcher/url_launcher.dart';

abstract interface class PurchasesLocalDataSource {
  Future<void> openUrl(String url);
}

class PurchasesLocalDataSourceImpl implements PurchasesLocalDataSource {
  @override
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
