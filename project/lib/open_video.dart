// ignore_for_file: empty_constructor_bodies
import 'package:project/product_Page.dart';

Future<void> openVideo(String url, dynamic LaunchMode) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw "Unable to open video";
  }
}
