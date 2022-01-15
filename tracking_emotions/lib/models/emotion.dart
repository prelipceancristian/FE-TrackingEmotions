class Emotion {
  final String EmotionId;
  final String Name;
  final String EmotionCategoryId;
  final String DescriptionId;
  final String DescriptionText;

  Emotion(
      {this.EmotionId,
      this.Name,
      this.EmotionCategoryId,
      this.DescriptionId,
      this.DescriptionText});

  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
        EmotionId: json['emotionID'].toString(),
        Name: json['name'],
        EmotionCategoryId: json['emotionCategoryId'].toString(),
        DescriptionId: json['descriptionID'].toString(),
        DescriptionText: json['text']);
  }
}
