import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/user/SearchPage.dart';
import 'package:wedweel/user/UserBlogs/UserBlogs.dart';
import 'package:intl/intl.dart';
import 'package:wedweel/user/UserHome/CardSectionGrid.dart';

class Userfirst extends StatelessWidget {
  final bool check;
  Userfirst({required this.check});

  String remainingDays(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now).inDays.abs();
    return '$difference days to go';
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd - MM - yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    DateTime fixedDate = DateTime(2025, 12, 18);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 250, 244),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('blog').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              final data = snapshot.data!.docs;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        remainingDays(fixedDate),
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.teal,
                        ),
                      ),
                      subtitle: Text(
                        'Wedding Date: ${formatDate(fixedDate)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Searchpage()));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.teal,
                          size: 30.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "Create Your Own Version\n Of Perfect Wedding",
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 21, 101, 93),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 233, 217),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        height: 220.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              "Are you tired?",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 21, 101, 93),
                              ),
                            ),
                            // SizedBox(height: 20.h),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, top: 15, bottom: 15),
                              child: Text(
                                'Tired of looking through every single vendor of each service type? We will select a tailored package that best fits your interests.',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            // SizedBox(height: 25.h),
                            Container(
                              width: 150.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 21, 101, 93),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Custom Package',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: 'Poppins-Medium',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    check
                        ? CardSectionGrid()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Text(
                                  "Tasks",
                                  style: TextStyle(
                                    fontSize: 21.sp,
                                    height: 3,
                                    fontFamily: 'Poppins-Medium',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 21, 101, 93),
                                  ),
                                ),
                              ),
                              Container(
                                height: 200.h,
                                padding: EdgeInsets.only(left: 10.w),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 15.w),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.w),
                                        height: 150.h,
                                        width: 170.w,
                                        margin: EdgeInsets.only(bottom: 20.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.asset(
                                                hall1,
                                                height: 105.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "make up",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontFamily: 'Poppins-Medium',
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 21, 101, 93),
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              "Pending",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                    ListTile(
                      leading: Text(
                        "Recent Events",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      trailing: Text(
                        "See All",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Container(
                      height: 200.h,
                      padding: EdgeInsets.only(left: 10.w),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final blogname = data[index]['name'];
                          final blogimage = data[index]['image'];
                          final blogdate = data[index]['date'];
                          return Container(
                            height: 150.h,
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.network(
                                      blogimage,
                                      height: 140.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 7.h),
                                      Text(
                                        blogname,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        blogdate,
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 11.h),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Userblogs(
                                                blogdate: data[index]['date'],
                                                blogtitle: data[index]['name'],
                                                blogimage: data[index]['image'],
                                                blogdescription: data[index]
                                                    ['description'],
                                                readtime: data[index]
                                                    ['read_time'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
