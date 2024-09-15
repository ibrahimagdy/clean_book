import 'package:bookly_app/core/helpers/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(context, String? url) async{
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
    else{
      customSnackBar(context, 'Cannot Launch $url', Colors.red);
    }
  }
}