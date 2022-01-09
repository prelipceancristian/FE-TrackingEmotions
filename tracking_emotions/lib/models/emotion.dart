class Emotion {
  final int EmotionID;
  final String Name;
  final int EmotionCategoryID;
  final String DescriptionID;

  Emotion({
    this.EmotionID,
    this.Name,
    this.EmotionCategoryID,
    this.DescriptionID,
  });

  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
        EmotionID: json['EmotionID'],
        Name: json['Name'],
        EmotionCategoryID: json['EmotionCategoryID'],
        DescriptionID: json['DescriptionID']);
  }
}
