class SocialEnvironment {
  final String SocialEnvironmentId;
  final String Relation;
  final bool IsLocation;

  SocialEnvironment({this.SocialEnvironmentId, this.Relation, this.IsLocation});

  factory SocialEnvironment.fromJson(Map<String, dynamic> json) {
    return SocialEnvironment(
        SocialEnvironmentId: json['socialEnvironmentID'].toString(),
        Relation: json['relation'],
        IsLocation: json['location'].toString() == "true");
  }
}
