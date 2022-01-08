class User {
  final int UserId;
  final String FirstName;
  final String LastName;
  final DateTime BirthDate;
  final String Username;
  final String Password;
  final String Gender;
  final String Email;

  User({
    this.UserId,
    this.FirstName,
    this.LastName,
    this.BirthDate,
    this.Username,
    this.Password,
    this.Gender,
    this.Email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserId: json['userId'],
      FirstName: json['FirstName'],
      LastName: json['LastName'],
      BirthDate: json['BirthDate'],
      Username: json['Username'],
      Password: json['Password'],
      Gender: json['Gender'],
      Email: json['title'],
    );
  }
}
