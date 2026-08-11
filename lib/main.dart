import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SovereignWebViewScreen(),
    );
  }
}

class SovereignWebViewScreen extends StatefulWidget {
  const SovereignWebViewScreen({super.key});

  @override
  State<SovereignWebViewScreen> createState() => _SovereignWebViewScreenState();
}

class _SovereignWebViewScreenState extends State<SovereignWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://10.0.2.2:3000')); // Tera local gateway/server URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}