class Tag {
  final String id;
  final String name;
  final String color;

  Tag({
    required this.id,
    required this.name,
    required this.color,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}
