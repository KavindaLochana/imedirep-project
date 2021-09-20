import 'package:flutter/material.dart';

class SiginInPage extends StatelessWidget {
  const SiginInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('Test'),
          ),
        ],
      ),
    );
  }
}
