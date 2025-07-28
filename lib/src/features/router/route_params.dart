class ProfileScreenParams {
  final String id;

  ProfileScreenParams({required this.id});

  Map<String, dynamic> toJson() => {'id': id};

  factory ProfileScreenParams.fromJson(Map<String, dynamic> json) =>
      ProfileScreenParams(id: json['id'] as String);
}
