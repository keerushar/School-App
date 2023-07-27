import 'package:flutter/material.dart';

class SchoolDashboardScreen extends StatelessWidget {
  const SchoolDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  30,
                ),
                bottomRight: Radius.circular(
                  30,
                ),
              ),
              color: Colors.blue),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saraswati Niketan Secondary School",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Brahma Tole, Kathmandu",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                CircleAvatar(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.amber),
            child: const Text(
              "About School",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
