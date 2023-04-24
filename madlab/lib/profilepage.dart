import 'package:flutter/material.dart';


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
          onPressed: () {},
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
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none, shape: const StadiumBorder()),
                    child: const Text("Update Profile")),
              ),
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
                  "My Transaction",
                  style: TextStyle(fontSize: 20),
                ),
                leading: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(
                    Icons.book_online_outlined,
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
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 20),
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
