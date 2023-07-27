import 'package:flutter/material.dart';
import 'package:school_app/data/dataproviders/fetch_employee_data.dart';
import 'package:school_app/data/models/employee.dart';
import 'package:school_app/widgets/employee_list_widget.dart';

class TeacherPhoneScreen extends StatefulWidget {
  const TeacherPhoneScreen({super.key});

  @override
  State<TeacherPhoneScreen> createState() => _TeacherPhoneScreenState();
}

class _TeacherPhoneScreenState extends State<TeacherPhoneScreen> {
  late List<Employee> employeeData;

  @override
  void initState()  {
    employeeData = FetchDataApi.employeeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          FutureBuilder(
          future: FetchDataApi.loadAddress(),
          builder: (context, AsyncSnapshot<List<Employee>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Error fetching data",
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return dashboardBody(context, employeeData);
          }), 
        ]),
      ),
    );
  }
}

Widget dashboardBody(BuildContext context, List<Employee> employeeData) {
  return Scrollbar(
    thumbVisibility: true,
    thickness: 6,
    child: ListView.builder(
        itemCount: employeeData.length,
        itemBuilder: (c, i) {
          return EmployeeListWidget(
            name: employeeData[i].name,
            phoneNo: employeeData[i].phone,
            email: employeeData[i].email,
            designation: "Teacher",
          );
        }),
  );
}
