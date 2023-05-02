class UserOpinion {
  late final String name;
  late final String birthDate;
  late final String? gender;
  late final String? originCountry;
  late final String? opinion;

  UserOpinion(this.name, this.birthDate, this.gender, this.originCountry, this.opinion);

  @override
  String toString() {
    return 'Name: $name\nBirthDate: $birthDate\nGender: $gender\nOpinion: $opinion\nCountry of Origin: $originCountry';
  }
}
