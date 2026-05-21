class HistoryModel {
  final int id;

  final String prompt;

  final String imageUrl;

  final String style;

  final String createdAt;

  HistoryModel({
    required this.id,
    required this.prompt,
    required this.imageUrl,
    required this.style,
    required this.createdAt,
  });

  factory HistoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return HistoryModel(
      id: json["id"],

      prompt: json["prompt"],

      imageUrl: json["image_url"],

      style: json["style"],

      createdAt: json["created_at"] ?? "",
    );
  }
}