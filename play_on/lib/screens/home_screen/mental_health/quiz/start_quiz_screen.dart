import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:play_on/screens/home_screen/mental_health/quiz/quiz.dart';

class StartQuiz extends StatefulWidget {
  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Assesment'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/mental-icon.png", // Replace with your image file path
                width: 200.0, // Adjust the width as needed
              ),
              SizedBox(
                height: 20,
              ),
              // Display an image
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(spreadRadius: 5, color: Colors.lightBlue)
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    // gradient: LinearGradient(colors: [Colors.lightBlue, Colors.purple])
                    color: const Color.fromARGB(255, 133, 195, 223),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to the Mental Health Assessment Portal, where your well-being is our priority. Take our mental health test to gain insights into your emotional well-being and discover ways to improve your mental health. Your mental health matters. Your mind is a powerful thing. When you fill it with positive thoughts, your life will start to change",
                      style: TextStyle(
                        // fontSize: 18, // Adjust the font size as needed
                        color: Colors.black, // Choose an appropriate text color
                        fontWeight: FontWeight
                            .bold, // You can use FontWeight.bold for emphasis
                        letterSpacing:
                            1.0, // Adjust the letter spacing as needed
                        fontStyle: FontStyle
                            .italic, // You can use FontStyle.italic for emphasis
                        height:
                            1.5, // Adjust the line height for better readability
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0), // Spacer
              // Start button
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Add code to handle button press (navigate to another screen, etc.)
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ));
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
