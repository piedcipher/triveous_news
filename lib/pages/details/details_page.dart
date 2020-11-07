import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: WebView(
        initialUrl: ModalRoute.of(context).settings.arguments as String,
      ),
    );
  }
}
