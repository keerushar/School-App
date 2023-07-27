import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/employee.dart';

class FetchDataApi {
  static final List<Employee> employeeList = [];

  static Future<String> loadAddressAsset() async {
    return await rootBundle.loadString("assets/json/employee.json");
  }

  static Future<List<Employee>> loadAddress() async {
    employeeList.clear();
    final jsonAddress = await loadAddressAsset();
    final jsonResponse = json.decode(jsonAddress);
    for (Map<String, dynamic> i in jsonResponse) {
      employeeList.add(Employee.fromJson(i));
    }

    return employeeList;
  }
}
