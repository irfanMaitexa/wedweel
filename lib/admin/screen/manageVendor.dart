import 'package:flutter/material.dart';

class Managevendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "manage vendor",
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
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
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('vendor1'),
                                    Text('address,8987')
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 30,
                            color: Colors.grey[350],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'view document',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  ))
                            ],
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
                Text('accepted')
              ]),
            )
          ],
        ),
      ),
    );
  }
}
