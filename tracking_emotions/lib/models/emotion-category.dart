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
      EmotionCategoryID: json['EmotionCategoryID'],
      Name: json['Name'],
      ValenceID: json['ValenceID'],
      Description: json['Description'],
      DescriptionID: json['DescriptionID'],
    );
  }
}
