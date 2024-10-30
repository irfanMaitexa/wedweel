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
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 205, 131),
                      radius: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: const Text(
                        "HAAM Wedding",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Nice to See you again",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    labelText: 'Enter your email ',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.1),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: const TextStyle(color: Colors.grey),
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
                    const Text(
                      'Remember me ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('forget password ?'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(double.maxFinite, 50),
                  ),
                  onPressed: () {
                    print('clicked');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(double.maxFinite, 50),
                  ),
                  onPressed: () {},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            // decoration: BoxDecoration(color: Colors.blue),
                            child: Image.network(
                                'https://cdn.iconscout.com/icon/free/png-512/free-google-logo-icon-download-in-svg-png-gif-file-formats--brands-pack-logos-icons-189824.png?f=webp&w=512',
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign-in with Google',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'create account',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
