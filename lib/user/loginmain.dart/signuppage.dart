import 'package:flutter/material.dart';
import 'package:wedweel/user/screen/layersSignUp/layer1.dart';
import 'package:wedweel/user/screen/layersSignUp/layer2.dart';
import 'package:wedweel/user/screen/layersSignUp/layer3.dart';

class SignUpUserPage extends StatelessWidget {
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
                top: 140,
                left: 59,
                child: Container(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
            Positioned(top: 255, right: 0, bottom: 0, child: LayerOne()),
            Positioned(
                top: 280, right: 0, bottom: 0, left: 20, child: LayerTwo()),
            Positioned(top: 120, right: 0, bottom: 0, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
