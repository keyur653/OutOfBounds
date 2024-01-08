
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:play_on/screens/home_screen/mental_health/constants/constants.dart';
import 'package:play_on/screens/home_screen/mental_health/result/result_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> questions = [
    "Nervousness or shakiness inside",
    "Faintness or dizziness",
    "The idea that someone else can control your thoughts",
    "Feeling others are to blame for most of your troubles",
    "Trouble remembering things",
    "Feeling easily annoyed or irritated",
    "Pains in heart or chest",
    "Feeling afraid in open spaces or on the streets",
    "Thoughts of ending your life",
    "Feeling that most people cannot be trusted",
    "Poor appetite",
    "Suddenly scared for no reason",
    "Temper outbursts that you could not control",
    "Feeling blocked in getting things done",
    "Feeling lonely",
    "Feeling blue",
    "Feeling no interest in things",
    "Feeling fearful",
    "Your feelings being easily hurt",
    "Feeling that people are unfriendly or dislike you",
    "Nausea or upset stomach",
    "Feeling inferior to others",
    "Feeling that you are watched or talked about by others",
    "Trouble falling asleep",
    "Having to check and double-check what you do",
    "Difficulty making decisions",
    "Feeling afraid to travel on buses, subways, or trains",
    "Trouble getting your breath",
    "Hot or cold spells",
    "Having to avoid certain things, places, or activities because they frighten you",
    "Your mind going blank",
    "Numbness or tingling in parts of your body",
    "Feeling hopeless about the future",
    "Trouble concentrating",
    "Feeling weak in parts of your body",
    "Feeling tense or keyed up",
    "Thoughts of death or dying",
    "Having urges to beat, injure, or harm someone",
    "Having urges to break or smash things",
    "Feeling very self-conscious with others",
    "Feeling uneasy in crowds, such as shopping or at a movie",
    "Spells of terror or panic",
    "Getting into frequent arguments",
    "Feeling nervous when you are left alone",
    "Others not giving you proper credit for your achievements",
    "Feeling lonely even when you are with people",
    "Feeling so restless you couldn't sit still",
    "Feelings of worthlessness",
    "Feeling that people will take advantage of you if you let them",
    "The idea that you should be punished for your sins",
    "Never feeling close to another person",
    "Feelings of guilt",
    "The idea that something is wrong with your mind",
  ];
  Map<int, String?> selectedOptions = {};
  List<String?> answersListf = List.filled(53, "0");
  List<String> options = [
    "Not at all",
    "A little Bit",
    "Moderately",
    "Quite A Bit",
    "Extremely"
  ];
  

  int currentQuestionIndex = 0;
  String? selectedOption;
  Future<void> sendAnswers() async {
    final String apiUrl = 'https://sih.shreeraj.me/mental';
    print(answersListf);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'mental_report': answersListf.join(','),
          'email':userEmail
        },
      );
      if (response.statusCode == 200) {
        List<String> map = response.body.substring(19, 64).split(",");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (ResultsPage(
                m: map,
              )),
            ));
      } else {
        // Handle errors
        print('Failed to send answers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error sending answers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assesment"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Question ${currentQuestionIndex + 1}',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                "For the past week, how much were you bothered by:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                questions[currentQuestionIndex],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Column(
                children: options.map((option) {
                  return RadioListTile(
                    title: Text(
                      option,
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: option,
                    groupValue: selectedOptions[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        if (value == "Not at all") {
                          answersListf[currentQuestionIndex] = "0";
                        }
                        if (value == "A little Bit") {
                          answersListf[currentQuestionIndex] = "1";
                        }
                        if (value == "Moderately") {
                          answersListf[currentQuestionIndex] = "2";
                        }
                        if (value == "Quite A Bit") {
                          answersListf[currentQuestionIndex] = "3";
                        }
                        if (value == "Extremely") {
                          answersListf[currentQuestionIndex] = "4";
                        }
                        selectedOption = value;
                        selectedOptions[currentQuestionIndex] =
                            value; // Store selected option for the current question
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentQuestionIndex > 0)
                    ElevatedButton(
                      onPressed: () {
                        // Check the answer and move to the next question
                        // You can implement the scoring logic here
                        if (currentQuestionIndex > 0) {
                          setState(() {
                            currentQuestionIndex--;
                            selectedOption = null;
                          });
                        } else {
                          // Quiz is finished, show results or navigate to a result screen
                          // Implement your desired behavior here
                        }
                      },
                      child: const Text("Previous"),
                    ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Check the answer and move to the next question
                      // You can implement the scoring logic here
                      if (currentQuestionIndex == 52) {
                        sendAnswers();
                      }
                      if (currentQuestionIndex < questions.length - 1) {
                        setState(() {
                          currentQuestionIndex++;
                          selectedOption = null;
                        });
                      } else {
                        // Quiz is finished, show results or navigate to a result screen
                        // Implement your desired behavior here
                      }
                    },
                    child: currentQuestionIndex == 52
                        ? const Text("Submit")
                        : const Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
