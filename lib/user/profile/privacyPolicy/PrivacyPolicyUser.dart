import 'package:flutter/material.dart';

class Privacypolicyuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Privacy Policy",
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 21, 101, 93)),
          ),
        ),
        body: Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 10, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text("What Information We Collect"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We collect information you provide, like your name, email, and wedding details. We may also collect information about how you use the app.",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("How We Use Your Information:"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "We use the information to provide and improve the app, respond to your requests, and communicate with you.",
                            style: TextStyle(fontSize: 13)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Sharing Your Information:"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'We may share your information with trusted vendors you choose to work with. We may also share information with companies that help us run our business, like payment processors.',
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Your Rights:"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "You can access and update your information.\nYou can request that we delete your account.",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Changes to This Privacy Policy:"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Contact Us:"),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "If you have any questions or concerns about this privacy policy, please contact us at WedWheel@gmail.com.",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
