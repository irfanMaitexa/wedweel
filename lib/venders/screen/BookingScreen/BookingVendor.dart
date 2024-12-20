import 'package:flutter/material.dart';

class Bookingvendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              "Booking Details",
              style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 23,
                  color: Color.fromARGB(255, 21, 101, 93),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
                labelColor: Color.fromARGB(255, 21, 101, 93),
                indicatorColor: Color.fromARGB(255, 21, 101, 93),
                tabs: [
                  Tab(
                    text: "Pending",
                  ),
                  Tab(
                    text: "Approved",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "asset/rb_859.png",
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ajay krishna'),
                                    Text('calicut,\n+91786547211')
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 30,
                            color: Colors.grey[350],
                          ),
                          Row(children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    side: BorderSide(color: Colors.green)),
                                onPressed: () {},
                                child: Text(
                                  'Accept',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    side: BorderSide(color: Colors.red)),
                                onPressed: () {},
                                child: Text(
                                  'Reject',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ])
                        ]),
                      ),
                    );
                  },
                ),
                
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "asset/rb_859.png",
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ajay krishna'),
                                    Text('calicut,\n+91786547211')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  },
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
