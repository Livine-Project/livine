import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeVideoWidget extends StatefulWidget {
  const RecipeVideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<RecipeVideoWidget> createState() => _RecipeVideoWidgetState();
}

class _RecipeVideoWidgetState extends State<RecipeVideoWidget> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.languageCode == "en" ? "Video" : "فيديو"),
        leading: IconButton(
            onPressed: () => context.go('/navigate'),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              key: _key,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
