enum UserType { developer, ngo, youthLeader }

enum SDGGoal {
  noPoverty,
  zeroHunger,
  goodHealth,
  qualityEducation,
  genderEquality,
  cleanWater,
  affordableEnergy,
  decentWork,
  industryInnovation,
  reducedInequalities,
  sustainableCities,
  responsibleConsumption,
  climateAction,
  lifeBelowWater,
  lifeOnLand,
  peaceJustice,
  partnerships
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final UserType userType;
  final String bio;
  final List<String> skills;
  final List<SDGGoal> interestedSDGs;
  final String location;
  final String? organization;
  final int experienceYears;
  final List<String> languages;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.userType,
    required this.bio,
    required this.skills,
    required this.interestedSDGs,
    required this.location,
    this.organization,
    required this.experienceYears,
    required this.languages,
    this.isAvailable = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      userType: UserType.values.firstWhere(
        (e) => e.toString().split('.').last == json['userType'],
        orElse: () => UserType.developer,
      ),
      bio: json['bio'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      interestedSDGs: (json['interestedSDGs'] as List? ?? [])
          .map((e) => SDGGoal.values[e])
          .toList(),
      location: json['location'] ?? '',
      organization: json['organization'],
      experienceYears: json['experienceYears'] ?? 0,
      languages: List<String>.from(json['languages'] ?? []),
      isAvailable: json['isAvailable'] ?? true,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'userType': userType.toString().split('.').last,
      'bio': bio,
      'skills': skills,
      'interestedSDGs': interestedSDGs.map((e) => e.index).toList(),
      'location': location,
      'organization': organization,
      'experienceYears': experienceYears,
      'languages': languages,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}