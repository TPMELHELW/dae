import 'package:dae/core/services/api_services.dart';

class HomeApiService {
  final ApiClient apiClient;

  HomeApiService(this.apiClient);

  Future<Map<String, dynamic>> getPrayerTimes(double lat, double lng) async {
    final url =
        'https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$lng&method=2';
    final result = await apiClient.get(url);
    return result['data'];
  }
}
