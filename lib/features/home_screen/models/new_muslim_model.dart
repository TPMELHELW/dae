import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dae/features/muslim/models/lessons_model.dart';

class NewMuslimModel {
  final String? id;
  final String? daeaId;
  final String? moalemId;
  final String gender;
  final String country;
  final String name;
  final String age;
  final String period;
  final String number;
  final String email;
  final String primaryLang;
  final String way;
  final String previousReligion;
  final String typeOfMuslim;
  final bool active;
  final String lastUpdate;
  final List<LessonsModel> lessons;

  NewMuslimModel({
    this.moalemId,
    this.id,
    this.active = false,
    required this.lastUpdate,
    required this.lessons,
    this.daeaId,
    required this.gender,
    required this.country,
    required this.name,
    required this.age,
    required this.period,
    required this.number,
    required this.email,
    required this.primaryLang,
    required this.way,
    required this.previousReligion,
    required this.typeOfMuslim,
  });

  Map<String, dynamic> toJson() {
    return {
      'DaeaId': daeaId,
      'Gender': gender,
      'LastUpdate': lastUpdate,
      'Lessons': lessons,
      'Active': active,
      'Country': country,
      'Name': name,
      'Age': age,
      'Period': period,
      'Number': number,
      'Email': email,
      'PrimaryLanguage': primaryLang,
      'Way': way,
      'PreviousReligion': previousReligion,
      'TypeOfMuslim': typeOfMuslim,
      'MoalemId': moalemId ?? '',
    };
  }

  factory NewMuslimModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    final lesson = data['Lessons'] as List;
    return NewMuslimModel(
      daeaId: data['DaeaId'],
      gender: data['Gender'],
      country: data['Country'],
      active: data['Active'],
      name: data['Name'],
      age: data['Age'],
      period: data['Period'],
      number: data['Number'],
      email: data['Email'],
      primaryLang: data['PrimaryLanguage'],
      way: data['Way'],
      previousReligion: data['PreviousReligion'],
      typeOfMuslim: data['TypeOfMuslim'],
      lastUpdate: data['LastUpdate'],
      lessons: lesson.map((item) => LessonsModel.fromSnapshot(item)).toList(),
      id: document.id,
      moalemId: data['MoalemId'] ?? '',
    );
  }
}
