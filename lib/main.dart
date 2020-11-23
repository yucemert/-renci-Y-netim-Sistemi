import 'package:flutter/material.dart';
import 'package:ssss/models/students.dart';
import 'package:ssss/screens/student_add.dart';
import 'package:ssss/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  students selectedStudent = students.withid(0, "", "", 0);

  List<students> student = [
    students.withid(1, "mert", "yüce", 15),
    students.withid(1, "semih", "uslu", 100),
    students.withid(1, "taha", "erkoc", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("sınav sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: student.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: (NetworkImage(
                            "https://i.ytimg.com/vi/CM1biibaygI/hqdefault.jpg")),
                      ),
                      title: Text(student[index].firstName +
                          " " +
                          student[index].lastName),
                      subtitle: Text("Sınavdan aldığı not : " +
                          student[index].grade.toString() +
                          " " +
                          " [ " +
                          student[index].getstatus +
                          " ] "),
                      trailing: buildStatusIcon(student[index].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = student[index];
                        });

                        print(selectedStudent.firstName);
                      });
                })),
        Text("Seçili Öğrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(student)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    student.remove(selectedStudent);
                  });
                  var mesaj = "Silindi : " + selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildStatusIcon(int grade) {
    //String mesaj = "";
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.access_alarm);
    } else {
      return Icon(Icons.clear);
    }
  }
}
