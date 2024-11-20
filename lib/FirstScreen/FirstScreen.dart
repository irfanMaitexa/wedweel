import 'package:flutter/material.dart';
import 'package:wedweel/config.dart';

class Firstscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                
                  image: AssetImage(
                    'asset/logo2.jpg',
                  ),
                  fit: BoxFit.cover,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
