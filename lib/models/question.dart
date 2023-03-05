import 'models.dart';

class Question {
  final String id;
  final String description;
  final List<Answer> answers;
  final String type;
  final String? image;
  final List<Tag> tags;
  final int difficulty;
  final Professor professor;

  Question({
    required this.id,
    required this.description,
    required this.answers,
    required this.type,
    this.image,
    required this.tags,
    required this.difficulty,
    required this.professor,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        description: json["description"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        type: json["type"],
        image: json["image"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        difficulty: json["difficulty"],
        professor: Professor.fromJson(json["professor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "type": type,
        "image": image,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "difficulty": difficulty,
        "professor": professor.toJson(),
      };
}
