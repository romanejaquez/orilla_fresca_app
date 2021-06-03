class CategoryPart {
  String? name;
  String? imgName;
  bool? isSelected = false;

  CategoryPart({
    this.name,
    this.imgName,
    this.isSelected
  });

  factory CategoryPart.fromJson(Map<String, dynamic> json) {
    return CategoryPart(
      name: json['name'],
      imgName: json['imgName'],
      isSelected: false
    );
  }

  static List<CategoryPart> fromJsonArray(List<dynamic> jsonParts) {
    List<CategoryPart> parts = [];

    jsonParts.forEach((jsonData) {
      parts.add(CategoryPart.fromJson(jsonData));
    });

    return parts;
  }
}