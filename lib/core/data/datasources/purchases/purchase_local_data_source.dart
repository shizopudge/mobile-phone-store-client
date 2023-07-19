import 'package:url_launcher/url_launcher.dart';

abstract interface class PurchaseLocalDataSource {
  Future<void> openUrl(String url);
}

class PurchaseLocalDataSourceImpl implements PurchaseLocalDataSource {
  @override
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
