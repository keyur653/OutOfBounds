import 'dart:convert';
import 'package:http/http.dart' as http;
import 'workout.dart'; // Import the correct workout class

class WorkoutApi {
  static Future<List<Workout>> getWorkout(
      String type, String difficulty) async {
    try {
      final Uri uri = Uri.parse('https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises');
      final Map<String, String> queryParams = {
        'type': type,
        'difficulty': difficulty,
      };
      final Map<String, String> headers = {
        'X-RapidAPI-Key': '6379ceae4dmshf8b2bda689a4f8cp1f6fe5jsn934c7d3a3746',
        'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com',
      };

      final response = await http.get(uri.replace(queryParameters: queryParams), headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        // You may need to adjust the following line to extract and create Workout objects correctly.
        List<Workout> workouts = Workout.workoutFromSnapshot(data);

        return workouts;
      } else {
        throw Exception('Failed to load workout data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred while fetching workout data');
    }
  }
}