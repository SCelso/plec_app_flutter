class Tag {
  final String id;
  final String name;
  final String color;

  Tag({
    required this.id,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}
