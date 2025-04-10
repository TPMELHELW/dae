import 'package:cloud_firestore/cloud_firestore.dart';

class NewMuslimModel {
  final String? daeaId;
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

  NewMuslimModel({
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
    };
  }

  factory NewMuslimModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;

    return NewMuslimModel(
      daeaId: data['DaeaId'],
      gender: data['Gender'],
      country: data['Country'],
      name: data['Name'],
      age: data['Age'],
      period: data['Period'],
      number: data['Number'],
      email: data['Email'],
      primaryLang: data['PrimaryLanguage'],
      way: data['Way'],
      previousReligion: data['PreviousReligion'],
      typeOfMuslim: data['TypeOfMuslim'],
    );
  }
}
