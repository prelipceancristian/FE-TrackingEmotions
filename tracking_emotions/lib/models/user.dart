class User {
  final String UserId;
  final String FirstName;
  final String LastName;
  final String BirthDate;
  final String Username;
  final String Password;
  final String Gender;
  final String Email;

  User(
      {this.UserId,
      this.LastName,
      this.FirstName,
      this.Email,
      this.BirthDate,
      this.Username,
      this.Password,
      this.Gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        UserId: json['userId'].toString(),
        FirstName: json['firstName'],
        Email: json['email'],
        LastName: json['lastName'],
        Gender: json['gender'],
        Username: json['username'],
        BirthDate: json['birthDate']);
  }
}
