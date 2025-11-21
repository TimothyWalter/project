// ignore_for_file: empty_constructor_bodies
import 'Product_Page.dart';
import 'package:flutter/material.dart';

Future<void> openVideo(String url, dynamic LaunchMode) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw "Unable to open video";
  }
}
