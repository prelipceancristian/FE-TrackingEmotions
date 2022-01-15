class EmotionLog {
  final int EmotionLogID;
  final int EmotionID;
  final int UserID;
  final int SocialEnvironmentID1;
  final int SocialEnvironmentID2;
  final DateTime Date;

  EmotionLog({
    this.EmotionLogID,
    this.EmotionID,
    this.UserID,
    this.SocialEnvironmentID1,
    this.SocialEnvironmentID2,
    this.Date,
  });

  factory EmotionLog.fromJson(Map<String, dynamic> json) {
    return EmotionLog(
        EmotionLogID: json['Emotion'],
        EmotionID: json['EmotionID'],
        UserID: json['UserID'],
        SocialEnvironmentID1: json['SocialEnvironmentID'],
        SocialEnvironmentID2: json['SocialEnvironmentID'],
        Date: json['Date']);
  }
}
