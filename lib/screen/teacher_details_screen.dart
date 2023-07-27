import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    designation!,
                    style: const TextStyle(fontSize: 16),
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
                          launchUrlString("tel://$phoneNo");
                        },
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.green,
                        )),
                    const Text(
                      "Call",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        launchUrlString('mailto:$email?subject=&body=');
                      },
                      icon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                    ),
                    const Text(
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
