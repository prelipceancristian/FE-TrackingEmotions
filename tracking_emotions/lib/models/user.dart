class User {
  final int UserId;
  final String FirstName;
  final String LastName;
  final DateTime BirthDate;
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
      UserId: json['userId'],
      FirstName: json['id'],
      Email: json['title'],
    );
  }
}
