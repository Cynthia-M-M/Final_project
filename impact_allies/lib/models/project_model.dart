import 'user_model.dart';

enum ProjectStatus { planning, active, completed, onHold }

class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String ownerId;
  final List<SDGGoal> targetSDGs;
  final List<String> requiredSkills;
  final ProjectStatus status;
  final DateTime startDate;
  final DateTime? endDate;
  final String location;
  final bool isRemote;
  final int maxParticipants;
  final List<String> currentParticipants;
  final List<String> applicants;
  final String? imageUrl;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ownerId,
    required this.targetSDGs,
    required this.requiredSkills,
    required this.status,
    required this.startDate,
    this.endDate,
    required this.location,
    this.isRemote = false,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.applicants,
    this.imageUrl,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      ownerId: json['ownerId'],
      targetSDGs: (json['targetSDGs'] as List? ?? [])
          .map((e) => SDGGoal.values[e])
          .toList(),
      requiredSkills: List<String>.from(json['requiredSkills'] ?? []),
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => ProjectStatus.planning,
      ),
      startDate: DateTime.parse(json['startDate']),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      location: json['location'] ?? '',
      isRemote: json['isRemote'] ?? false,
      maxParticipants: json['maxParticipants'] ?? 10,
      currentParticipants: List<String>.from(json['currentParticipants'] ?? []),
      applicants: List<String>.from(json['applicants'] ?? []),
      imageUrl: json['imageUrl'],
      metadata: json['metadata'] ?? {},
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ownerId': ownerId,
      'targetSDGs': targetSDGs.map((e) => e.index).toList(),
      'requiredSkills': requiredSkills,
      'status': status.toString().split('.').last,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'location': location,
      'isRemote': isRemote,
      'maxParticipants': maxParticipants,
      'currentParticipants': currentParticipants,
      'applicants': applicants,
      'imageUrl': imageUrl,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}