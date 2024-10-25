import 'package:flutter/material.dart';

class Lok extends StatelessWidget {
  const Lok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 205, 131),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "HAAM Wedding",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nice to See you again",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    labelText: 'Enter your email ',
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.1),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.password),
                    prefixIconColor: Colors.grey,
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.1),
                  ),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.6, // Change to desired scale factor
                      child: Switch(
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ),
                    Text(
                      'Remember me ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {}, child: Text('forget password ?')),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        fixedSize: Size(double.maxFinite, 50)),
                    onPressed: () {
                      print('clicked');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text('create account',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
