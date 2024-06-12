import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hakkında')),
      body: Center(child: Text('Hakkında İçeriği')),
    );
  }
}
