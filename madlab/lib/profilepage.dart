import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madlab/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:madlab/signin.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilepage(),
    );
  }
}

// ignore: camel_case_types
class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

// ignore: camel_case_types
class _profilepageState extends State<profilepage> {
  int likes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => HomeScreen(key: UniqueKey()),
              ),
              (route) =>
                  true, //if you want to disable back feature set to false
            );
          },
        ),
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profilepic.jpg"),
                maxRadius: 60,
              ),
              const SizedBox(height: 10),
              const Text(
                "Ravi Pandey",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.email,
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "rshanker084@gmail.com",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: 120,
              //   child: ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(
              //           side: BorderSide.none, shape: const StadiumBorder()),
              //       child: const Text("Update Profile")),
              // ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "My Matches",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(
                    Icons.generating_tokens,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Refer and Earn",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('user_uid');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your profile is ❤️'ed by $likes coders",
                style: TextStyle(fontSize: 15, color: Colors.black),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              likes++;
            });
          },
          child: const Icon(Icons.thumb_up_off_alt_rounded)),
    );
  }
}
