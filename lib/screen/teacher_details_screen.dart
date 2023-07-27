import 'package:flutter/material.dart';

class TeacherDetailsScreen extends StatelessWidget {
  final String? name;
  final String? designation;
  final String? email;
  final String? phoneNo;

  const TeacherDetailsScreen({
    super.key,
    this.name,
    this.designation,
    this.email,
    this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: const Color(0XFFF9FBFC),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 172,
              width: double.infinity,
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      name!.substring(0, 1).toUpperCase(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    name!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                   designation!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // showModalBottomWidget(
                        //   context,
                        //   phoneNo!,
                        //   emergencyNo!,
                        //   personalNo!,
                        // );
                      },
                      icon: Icon(Icons.phone)
                    ),
                    Text(
                      "Call",
                      style: TextStyle(
                        color: Color.fromARGB(255, 151, 56, 56),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // launchUrlString('mailto:$email?subject=&body=');
                      },
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Mail",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
           ],
        ),
      ),
    );
  }
}
