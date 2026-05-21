class AppUserModel {
  final int id;

  final String name;

  final String email;

  final int credits;

  AppUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.credits,
  });

  factory AppUserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AppUserModel(
      id: json["id"],

      name: json["name"],

      email: json["email"],

      credits: json["credits"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "credits": credits,
    };
  }
}