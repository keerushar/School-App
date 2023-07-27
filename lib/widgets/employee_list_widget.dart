import 'package:flutter/material.dart';

class EmployeeListWidget extends StatelessWidget {
  final String? name;
  final String? phoneNo;
  final String? email;
  final String? designation;

  const EmployeeListWidget(
      {super.key, this.name, this.phoneNo, this.email, this.designation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.grey.shade200),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      padding: const EdgeInsets.all(
        10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green,
            child: Text(
              name!.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  designation!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
          ),
        ],
      ),
    );
  }
}
