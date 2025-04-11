class LessonsModel {
  final String level;
  final String status;
  final String period;
  final String lesson;
  final String time;

  LessonsModel({
    required this.time,
    required this.level,
    required this.status,
    required this.period,
    required this.lesson,
  });

  factory LessonsModel.fromSnapshot(Map<String, dynamic> data) {
    // final data = document.data()!;
    return LessonsModel(
      level: data['Level'] ?? '',
      status: data['Status'] ?? '',
      period: data['Period'] ?? '',
      lesson: data['Lesson'] ?? '',
      time: data['Time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Level': level,
      'Status': status,
      'Period': period,
      'Lesson': lesson,
      'Time': time,
    };
  }
}
