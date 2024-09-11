import 'package:catbreeds/presentation/base_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailViewModel extends BaseViewModel {
  void launchWikipedia(String? url) async {
    if (url == null) return;
    final Uri uri = Uri.parse('url');

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
