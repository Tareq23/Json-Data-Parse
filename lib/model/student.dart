import 'package:flutter/services.dart';

class StudentModel {
   String? name;
   String? id;
   String? department;
   String? session;
   String? university;
   String? college;
   String? email;
   String? about;
  StudentModel(
      {this.name,
      this.id,
      this.department,
      this.session,
      this.college,
      this.university,
      this.email,
      this.about});

   StudentModel.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    id = parsedJson['id'];
    department = parsedJson['department'];
    session = parsedJson['session'];
    college = parsedJson['college'];
    university = parsedJson['university'];
    email = parsedJson['email'];
    about = parsedJson['about'];
  }
}
