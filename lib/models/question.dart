import 'models.dart';

class Question {
  final String id;
  final String description;
  final List<Answer> answers;
  final String type;
  final String image;
  final List<Tag> tags;
  final int difficulty;
  final Professor professor;

  Question({
    required this.id,
    required this.description,
    required this.answers,
    required this.type,
    required this.image,
    required this.tags,
    required this.difficulty,
    required this.professor,
  });

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
