import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imedirep/googleSignIn/googleSignInProvider.dart';

class SiginInPage extends StatelessWidget {
  const SiginInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text('Test'),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Sign Up With Google'),
              //signin button
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
          ),
        ],
      ),
    );
  }
}
