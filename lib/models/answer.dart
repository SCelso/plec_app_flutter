class Answer {
  final String text;
  final int val;

  Answer({
    required this.text,
    required this.val,
  });

  Map<String, dynamic> toJson() => {
        "text": text,
        "val": val,
      };
}
