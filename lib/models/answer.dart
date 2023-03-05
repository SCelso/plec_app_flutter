class Answer {
  final String text;
  final int val;

  Answer({
    required this.text,
    required this.val,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"],
        val: json["val"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "val": val,
      };
}
