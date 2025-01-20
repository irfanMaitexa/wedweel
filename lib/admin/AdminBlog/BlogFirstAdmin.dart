import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedweel/admin/AdminBlog/AddBlog.dart';
import 'package:wedweel/admin/AdminBlog/EditBlog.dart';
import 'package:wedweel/imageVendor.dart';
import 'package:wedweel/main.dart';

class Blogfirstadmin extends StatelessWidget {
  Widget containgrid({required String image, required String name}) {
    return Container(
      height: 90,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 95.h,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins-Regular',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 250, 244),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Container(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "Blogs ",
                  style: TextStyle(
                    fontSize: 27,
                    color: Color.fromARGB(255, 21, 101, 93),
                  ),
                )),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                crossAxisCount: 2,
                children: [
                  containgrid(
                      image: 'asset/information_14875512.png',
                      name: "Blog details"),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddBlog()));
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddBlog()));
                        },
                        child: containgrid(
                            image: "asset/essay_3253267.png", name: "Add blog"),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Editblog()));
                    },
                    child: containgrid(
                        image: 'asset/engineering_13337559.png',
                        name: 'Edit blog'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
