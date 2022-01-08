class EmotionLog {
  final int EmotionLogID;
  final int EmotionID;
  final int UserID;
  final int SocialEnvironmentID;
  final DateTime Date;

  EmotionLog({
    this.EmotionLogID,
    this.EmotionID,
    this.UserID,
    this.SocialEnvironmentID,
    this.Date,
  });

  factory EmotionLog.fromJson(Map<String, dynamic> json) {
    return EmotionLog(
        EmotionLogID: json['Emotion'],
        EmotionID: json['EmotionID'],
        UserID: json['UserID'],
        SocialEnvironmentID: json['SocialEnvironmentID'],
        Date: json['Date']);
  }
}
