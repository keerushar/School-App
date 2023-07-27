class Employee {
  String? id;
  String? name;
  String? phone;
  String? email;

  Employee({this.id, this.name, this.phone, this.email});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}