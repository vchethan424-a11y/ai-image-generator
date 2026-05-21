class ProfileModel {
  final int id;

  final String name;

  final String email;

  final int credits;

  final String createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.credits,
    required this.createdAt,
  });

  factory ProfileModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProfileModel(
      id: json["id"],

      name: json["name"],

      email: json["email"],

      credits: json["credits"],

      createdAt: json["created_at"] ?? "",
    );
  }
}