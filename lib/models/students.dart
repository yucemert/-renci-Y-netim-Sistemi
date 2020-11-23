class students {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  students.withid(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._status = "geçti";
  }
  students(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._status = "geçti";
  }
  students.withoutinfo() {}

  String get getstatus {
    String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade >= 40) {
      message = "puanlamaya kaldı";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
