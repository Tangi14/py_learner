import 'package:flutter/material.dart';
import 'package:py_learner/loginscreen.dart'; // Import the LoginScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 0; // Track which question is being shown
  int? selectedAnswer; // Track the selected answer

  // Define the list of questions and answers
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'How would you describe your experience with object-oriented programming?',
      'answers': [
        'I have never used it.',
        'I have some theoretical knowledge.',
        'I have written simple programs.',
        'I have extensive experience.',
      ],
    },
    {
      'question':
          'How comfortable are you with using an Integrated Development Environment (IDE) for coding?',
      'answers': [
        'I have never used an IDE.',
        'I have used an IDE a few times.',
        'I regularly use an IDE for coding.',
        'I am highly proficient with multiple IDEs.',
      ],
    },
    {
      'question':
          'How familiar are you with basic programming concepts such as loops, conditionals, and variables?',
      'answers': [
        'I am not familiar with these concepts.',
        'I have a basic understanding of these concepts.',
        'I can use these concepts to write simple programs.',
        'I am very comfortable with these concepts.',
      ],
    },
  ];

  // Function to handle the "Next" and "Continue" button logic
  void nextStep() {
    if (selectedAnswer != null) {
      setState(() {
        if (currentStep < questions.length - 1) {
          currentStep++;
          selectedAnswer = null; // Reset selected answer for the next question
        } else {
          // Last step: Navigate to the login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentStep];
    final answers = currentQuestion['answers'] as List<String>;

    return Scaffold(
      backgroundColor: Colors.indigo[900], // Dark blue background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40), // Space for balance

            // Question Indicator (3 small circles)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(questions.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentStep == index
                        ? Colors.white // Filled circle for the current step
                        : Colors.transparent, // Empty circle for other steps
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40), // Add space between circles and question

            // Question Text
            Text(
              currentQuestion['question'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Answer Options
            Column(
              children: List.generate(answers.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswer = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: selectedAnswer == index
                          ? Colors.blueAccent // Highlight selected answer
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedAnswer == index
                            ? Colors.blueAccent
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      answers[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedAnswer == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),

            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: nextStep,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  currentStep == questions.length - 1 ? 'Continue' : 'Next',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space at the bottom for balance
          ],
        ),
      ),
    );
  }
}
