import 'package:flutter/material.dart';
import 'package:wedweel/user/screen/layers/layer1.dart';
import 'package:wedweel/user/screen/layers/layer2.dart';
import 'package:wedweel/user/screen/layers/layer3.dart';

class LoginUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('asset/primaryBg.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 150,
                left: 59,
                child: Container(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(
                top: 320, right: 0, bottom: 0, left: 20, child: LayerTwo()),
            Positioned(top: 160, right: 0, bottom: 0, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
