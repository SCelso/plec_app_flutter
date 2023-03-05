class Professor {
  final String id;
  final String email;
  final String name;

  Professor({
    required this.id,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
      };
}
