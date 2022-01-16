class EmotionLogDescriptor {
  final int EmotionLogID;
  final String Date;
  final String EmotionName;
  final String EmotionDescription;
  final String SocialEnvironment1;
  final String SocialEnvironment2;

  EmotionLogDescriptor({
    this.EmotionLogID,
    this.Date,
    this.EmotionName,
    this.EmotionDescription,
    this.SocialEnvironment1,
    this.SocialEnvironment2,
  });

  factory EmotionLogDescriptor.fromJson(Map<String, dynamic> json) {
    return EmotionLogDescriptor(
        EmotionLogID: json['emotionLogID'],
        Date: json['date'],
        EmotionName: json['emotionName'],
        EmotionDescription: json['emotionDescription'],
        SocialEnvironment1: json['socialEnvironment1'],
        SocialEnvironment2: json['socialEnvironment2']);
  }
}
