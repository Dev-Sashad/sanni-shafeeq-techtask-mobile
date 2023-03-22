// custom model of the response from the get
//ingredients api to handle the json response to a dart class
class IngredientModel {
  String? title;
  String? useBy;

  IngredientModel({this.title, this.useBy});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    useBy = json["use-by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["use-by"] = useBy;
    return _data;
  }
}
