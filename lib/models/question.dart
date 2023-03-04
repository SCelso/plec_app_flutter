import 'answer.dart';

class Question {
  final String id;
  final String title;
  final String description;
  final List<Answer> answers;
  final String type;
  final String image;
  //final List<TagInt> tags;
  final int difficulty;
  //final ProfessorInt professor;

  Question({
    required this.id,
    required this.title,
    required this.description,
    required this.answers,
    required this.type,
    required this.image,
    //required this.tags,
    required this.difficulty,
    //required this.professor,
  });

  // factory Question.fromJson(Map<String, dynamic> json) => Question(
  //       id: json["id"],
  //       title: json["title"],
  //       description: json["description"],
  //       answers: List<AnswerInt>.from(
  //           json["answers"].map((x) => AnswerInt.fromJson(x))),
  //       type: json["type"],
  //       image: json["image"],
  //       tags: List<TagInt>.from(json["tags"].map((x) => TagInt.fromJson(x))),
  //       difficulty: json["difficulty"],
  //       professor: ProfessorInt.fromJson(json["professor"]),
  //     );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        //"answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "type": type,
        "image": image,
        //"tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "difficulty": difficulty,
        //  "professor": professor.toJson(),
      };
}
