import 'package:flutter/material.dart';
import 'package:ssss/models/students.dart';
import 'package:ssss/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<students> student1;
  StudentAdd(List<students> student1) {
    this.student1 = student1;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(student1);
  }
}

class _StudentAddState extends State with StudentValidatorMixin {
  List<students> student1;
  var student = students.withoutinfo();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<students> student1) {
    this.student1 = student1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Mert"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci soyadı", hintText: "Yüce"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Notu", hintText: "55"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          student1.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
