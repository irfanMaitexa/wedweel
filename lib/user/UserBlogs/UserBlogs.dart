import 'package:flutter/material.dart';

class Userblogs extends StatelessWidget {
  const Userblogs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset("asset/previous 1.png",
                    height: 45, width: 45, fit: BoxFit.cover),
                trailing: Image.asset("asset/notification.png",
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "asset/freepik__upload__334.jpeg",
                    // height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "muhammed & fathima Wedding",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text("05 may 2023 :GrandView : 250 - 300 Guests"),
              ),
              ListTile(
                leading: Text("25000 "),
                title: Text(
                  "(Total Cost)",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 123, 123, 123)),
                ),
              ),
              
                 Text("Wonderful Wedding Party",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              
              
                Text(
                    "I got married at the KREVA almost 3 weeks ago now and I'm still reeling from how amazing everything was. My husband and I each had multiple people tell us it was the best wedding they'd ever been to, and everything that was done for us was so meticulously thought out and special. If I had to do it all over again, I’d undoubtedly still choose the KREVA!"),
              
            ],
          ),
        ),
      ),
    );
  }
}
