import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/user/screen/layers/layer1.dart';
import 'package:wedweel/user/screen/layers/layer2.dart';
import 'package:wedweel/user/screen/layers/layer3.dart';

class Loginvendor extends StatelessWidget {
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
                top: 80,
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
            Positioned(top: 200.h, right: 0.w, bottom: 0.h, child: LayerOne()),
            Positioned(
                top: 225.h, right: 0.w, bottom: 0.h, left: 20.w, child: LayerTwo()),
            Positioned(top: 120.h, right: 0.w, bottom: 0.h, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}
