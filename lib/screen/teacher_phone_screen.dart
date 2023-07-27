import 'package:flutter/material.dart';
import 'package:school_app/data/dataproviders/fetch_employee_data.dart';
import 'package:school_app/data/models/employee.dart';
import 'package:school_app/widgets/employee_list_widget.dart';
import 'package:school_app/widgets/search_widgets.dart';

class TeacherPhoneScreen extends StatefulWidget {
  const TeacherPhoneScreen({super.key});

  @override
  State<TeacherPhoneScreen> createState() => _TeacherPhoneScreenState();
}

class _TeacherPhoneScreenState extends State<TeacherPhoneScreen> {
  TextEditingController? _searchController;
  String query = '';
  late List<Employee> employee;
  final _searchFocusNode = FocusNode();

  late List<Employee> employeeData;

  @override
  void initState() {
    employeeData = FetchDataApi.employeeList;
    _searchController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            employeeDashboardBody(),
            employeeBar(context),
            searchWidget(context)
          ],
        ),
      ),
    );
  }

  Container employeeBar(BuildContext context) {
    return Container(
      height: 129,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Teachers",
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<Employee>> employeeDashboardBody() {
    return FutureBuilder(
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
          return Padding(
            padding: const EdgeInsets.only(top: 128.0),
            child: dashboardBody(context, employeeData),
          );
        });
  }

  SizedBox searchWidget(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 101,
            ),
            SizedBox(
              height: 49,
              child: Material(
                elevation: 2,
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: SearchWidget(
                  onChanged: searchItems,
                  text: query,
                  isFocus: false,
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchItems(String query) {
    final items = FetchDataApi.employeeList.where((item) {
      final titleLower = item.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      employeeData = items;
    });
  }
}

Widget dashboardBody(BuildContext context, List<Employee> employeeData) {
  return Scrollbar(
    thumbVisibility: true,
    thickness: 6,
    child: ListView.builder(
        itemCount: employeeData.length,
        itemBuilder: (c, i) {
          employeeData.sort((a, b) => a.name!.compareTo(b.name!));
          return EmployeeListWidget(
            name: employeeData[i].name,
            phoneNo: employeeData[i].phone,
            email: employeeData[i].email,
            designation: "Teacher",
          );
        }),
  );
}
