import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String email;
  String number;
  String userName;
  bool isDaea;

  UserModel({
    required this.id,
    required this.isDaea,
    required this.userName,
    required this.email,
    required this.number,
  });

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'PhoneNumber': number,
      'isDaea': isDaea,
      'UserName': userName,
    };
  }

  static UserModel empty() =>
      UserModel(id: '', email: '', number: '', isDaea: false, userName: '');

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['Email'] ?? '',
      number: data['PhoneNumber'] ?? '',
      isDaea: data['isDaea'],
      userName: data['UserName'],
    );
  }

  factory UserModel.fromStorage(Map<String, dynamic> document) {
    return UserModel(
      id: FirebaseAuth.instance.currentUser!.uid,
      email: document['Email'] ?? '',
      number: document['PhoneNumber'] ?? '',
      isDaea: document['isDaea'],
      userName: document['UserName'],
    );
  }

  // Add the copyWith method
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? number,
    String? profilePicture,
    bool? isApproved,
    String? plan,
    List? friendList,
    String? lastSeen,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      number: number ?? this.number,
      isDaea: isDaea ?? this.isDaea,
      userName: userName ?? this.userName,
    );
  }
}
