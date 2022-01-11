class EmotionCategory {
  final int EmotionCategoryID;
  final String Name;
  final int ValenceID;
  final String Description;
  final int DescriptionID;

  EmotionCategory({
    this.EmotionCategoryID,
    this.Name,
    this.ValenceID,
    this.Description,
    this.DescriptionID,
  });

  factory EmotionCategory.fromJson(Map<String, dynamic> json) {
    return EmotionCategory(
      EmotionCategoryID: json['emotionCategoryID'],
      Name: json['name'],
      ValenceID: json['valenceID'],
      Description: json['description'],
      DescriptionID: json['descriptionID'],
    );
  }
}
