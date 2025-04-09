import 'package:dae/features/home_screen/screens/widgets/daeah_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/prayer_time_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrayerTimeWidget(),
          SizedBox(height: 20),
          SearchWidget(),
          DaeahWidget(),
        ],
      ),
    );
  }
}
