class UIMenuModel {
  int id;
  String name;
  String label;
  String path;
  int order;
  bool isSelected;

  UIMenuModel(
    this.id,
    this.name,
    this.label,
    this.path,
    this.order,
    this.isSelected,
  );

  UIMenuModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        label = json['label'],
        path = json['path'],
        order = json['order'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['label'] = label;
    data['path'] = path;
    data['order'] = order;
    data['isSelected'] = isSelected;
    return data;
  }

  static List<UIMenuModel> listFromJson(
      Map<String, dynamic> json, String name) {
    List<dynamic> cards = json[name] ?? [];
    List<UIMenuModel> list =
    cards.map((card) => UIMenuModel.fromJson(card)).toList();
    return list;
  }
}
