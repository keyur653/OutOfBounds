import 'package:flutter/material.dart';
import 'package:play_on/screens/home_screen/mental_health/api/workout.dart';
import 'package:play_on/screens/home_screen/mental_health/api/workout_api.dart';

class MyHomePage extends StatefulWidget {
  final String type;
  final String difficulty;

  const MyHomePage({Key? key, required this.type, required this.difficulty})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Workout> _workouts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  Future<void> _fetchWorkouts() async {
    try {
      _workouts = await WorkoutApi.getWorkout(widget.type, widget.difficulty);
    } catch (e) {
      print('Error fetching workouts: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout List"),
        backgroundColor: Colors.blue, // Change the app bar background color
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_workouts.isEmpty) {
      return Center(
        child: Text(
          'No workouts available.',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _workouts.length,
        itemBuilder: (context, index) {
          final workout = _workouts[index];
          return _buildWorkoutCard(workout);
        },
      );
    }
  }

  Widget _buildWorkoutCard(Workout workout) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      color: Colors.white, // Change the card background color
      child: ListTile(
        title: Text(
          workout.name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Type: ${workout.type}",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Muscle: ${workout.muscle}",
              style: TextStyle(color: Colors.green),
            ),
            Text(
              "Equipment: ${workout.equipment}",
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              "Difficulty: ${workout.difficulty}",
              style: TextStyle(color: Colors.red),
            ),
            Text(
              "Instructions: ${workout.instructions}",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}