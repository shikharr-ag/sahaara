import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'my_user.g.dart';

@CopyWith()
class MyUserModel extends Equatable {
  final String uid;
  final int age;
  final String gender;
  final DateTime createdAt;
  final String name;
  final String email;
  final List<String> sessionIds;
  final List<String> journalIds;
  final List<String> reasons;

  const MyUserModel({
    required this.reasons,
    required this.uid,
    required this.age,
    required this.gender,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.sessionIds,
    required this.journalIds,
  });

  // Factory constructor for the initial state
  factory MyUserModel.initial() {
    return MyUserModel(
      uid: '',
      age: 0,
      gender: '',
      createdAt: DateTime.now(),
      name: '',
      email: '',
      sessionIds: [],
      journalIds: [],
      reasons: [],
    );
  }

  // Factory constructor for deserialization
  factory MyUserModel.fromJson(Map<String, dynamic> json) {
    return MyUserModel(
        uid: json['uid'] as String,
        age: json['age'] as int,
        gender: json['gender'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        name: json['name'] as String,
        email: json['email'] as String,
        sessionIds: List<String>.from(json['sessionIds'] as List<dynamic>),
        journalIds: List<String>.from(json['journalIds'] as List<dynamic>),
        reasons: List<String>.from(json['reasons'] as List<dynamic>));
  }

  // Method for serialization
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'age': age,
      'gender': gender,
      'createdAt': createdAt.toIso8601String(),
      'name': name,
      'email': email,
      'sessionIds': sessionIds,
      'journalIds': journalIds,
      'reasons': reasons,
    };
  }

  @override
  List<Object?> get props => [
        uid,
        age,
        gender,
        createdAt,
        name,
        email,
        sessionIds,
        journalIds,
      ];
}
