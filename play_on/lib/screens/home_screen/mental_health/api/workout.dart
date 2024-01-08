// ignore_for_file: public_member_api_docs, sort_constructors_first
class Workout {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;
  Workout({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });
  factory Workout.fromJson(dynamic json) {
    return Workout(
        name: json['name'] as String,
        type: json['type'] as String,
        muscle: json['muscle'] as String,
        equipment: json['equipment'] as String,
        difficulty: json['difficulty'] as String,
        instructions: json['instructions'] as String);
  }
  static List<Workout> workoutFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Workout.fromJson(data);
    }).toList();
  }
}
