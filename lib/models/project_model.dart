// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

List<Project> projectFromJson(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

String projectToJson(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  final String id;
  final String name;
  final List<Member> members;
  final double progress;
  final String description;

  Project({
    required this.id,
    required this.name,
    required this.members,
    required this.progress,
    required this.description,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        progress: json["progress"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "progress": progress,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  final String name;
  final String role;

  Member({
    required this.name,
    required this.role,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
      };
}
