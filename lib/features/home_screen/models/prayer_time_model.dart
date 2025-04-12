class PrayerTimeModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final HijriDate hijri;

  PrayerTimeModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijri,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    final timings = json['timings'];
    return PrayerTimeModel(
      fajr: timings['Fajr'],
      sunrise: timings['Sunrise'],
      dhuhr: timings['Dhuhr'],
      asr: timings['Asr'],
      maghrib: timings['Maghrib'],
      isha: timings['Isha'],
      hijri: HijriDate.fromJson(json['date']['hijri']),
    );
  }
}

class HijriDate {
  final String day;
  final int monthNumber;
  final String monthName;
  final String weekday;
  final String year;

  HijriDate({
    required this.day,
    required this.monthNumber,
    required this.monthName,
    required this.weekday,
    required this.year,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      day: json['day'],
      monthNumber: json['month']['number'],
      monthName: json['month']['en'],
      weekday: json['weekday']['en'],
      year: json['year'],
    );
  }
}
