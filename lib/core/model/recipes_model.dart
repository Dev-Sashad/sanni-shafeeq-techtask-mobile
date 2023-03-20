class RecipesModel {
  String? title;
  List<String>? ingredients;

  RecipesModel({this.title, this.ingredients});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    ingredients = json["ingredients"] == null
        ? null
        : List<String>.from(json["ingredients"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    if (ingredients != null) {
      _data["ingredients"] = ingredients;
    }
    return _data;
  }
}
