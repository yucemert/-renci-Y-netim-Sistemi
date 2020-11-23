class StudentValidatorMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim 2 karakterden az olamaz";
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyad 2 karakterden az olamaz";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 aralığında olmalıdır";
    }
  }
}
