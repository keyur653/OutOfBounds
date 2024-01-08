import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  const DetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Map<String, dynamic>> illnessData = [
    {
      'name': 'Somatization',
      'details':
          'Somatization is the expression of psychological or emotional factors as physical (somatic) symptoms. For example, stress can cause some people to develop headaches, chest pain, back pain, nausea, or fatigue.',
      'remedies': [
        "1. Psychotherapy, such as cognitive-behavioral or psychodynamic therapy, to address underlying emotional issues.",
        "2. Practice mindfulness, meditation, and relaxation techniques to reduce stress and improve mind-body awareness.",
        "3. Engage in regular physical activity and maintain a healthy lifestyle.",
        "4. Medication prescribed by a healthcare professional in some cases.",
        "5. Seek support from support groups and educational resources for coping.",
        "6. Consult with a healthcare provider for personalized guidance."
      ],
    },
    {
      'name': 'OCD',
      'details':
          'OCD is a mental health disorder characterized by uncontrollable, recurring thoughts (obsessions) and repetitive behaviors or rituals (compulsions) that are performed to alleviate anxiety.',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT), particularly Exposure and Response Prevention (ERP), to address obsessions and compulsions.",
        "2. Medication, usually selective serotonin reuptake inhibitors (SSRIs) like fluoxetine or sertraline.",
        "3. Deep Brain Stimulation (DBS) for severe, treatment-resistant cases.",
        "4. Consult a mental health professional for accurate diagnosis and personalized treatment."
      ],
    },
    {
      'name': 'Interpersonal Sensitivity',
      'details':
          "Interpersonal Sensitivity refers to the ability to perceive and understand other people's emotions, thoughts, and behaviors in social interactions.",
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge negative thought patterns and develop healthier ways of interacting with others.",
        "2. Interpersonal therapy (IPT) to improve interpersonal relationships and communication skills.",
        "3. Mindfulness and emotional regulation techniques.",
        "4. Assertiveness training to express needs and boundaries effectively.",
        "5. Build social support networks and seek guidance from a mental health professional.",
      ],
    },
    {
      'name': 'Depression',
      'details':
          "Depression is a mental health disorder characterized by persistent feelings of sadness, hopelessness, and disinterest in activities that were once enjoyable.",
      'remedies': [
        "1. Psychotherapy, such as cognitive-behavioral therapy (CBT) or interpersonal therapy (IPT), to address negative thought patterns and improve coping strategies.",
        "2. Medication, including selective serotonin reuptake inhibitors (SSRIs) or other antidepressants.",
        "3. Lifestyle modifications, such as regular exercise, a balanced diet, sufficient sleep, and stress management.",
        "4. Build a strong support system through social connections and support groups.",
        "5. Consult with a healthcare professional for a personalized treatment plan and ongoing monitoring of progress."
      ],
    },
    {
      'name': 'Anxiety',
      'details':
          'Anxiety is a mental health disorder characterized by excessive and persistent worry, fear, and unease.',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge anxious thought patterns and develop coping strategies.",
        "2. Medications like selective serotonin reuptake inhibitors (SSRIs) or benzodiazepines in some cases.",
        "3. Relaxation techniques such as deep breathing, mindfulness meditation, and progressive muscle relaxation.",
        "4. Lifestyle modifications including regular exercise, a balanced diet, adequate sleep, and stress management.",
        "5. Seek support from a mental health professional and consider support groups for guidance and community."
      ],
    },
    {
      'name': 'Hostility',
      'details':
          'Hostility is a psychological state characterized by a negative attitude, anger, aggression, and a tendency to respond aggressively to stimuli.',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to understand and modify thought patterns that contribute to hostile behavior.",
        "2. Anger management therapy to recognize and manage anger through techniques like deep breathing and problem-solving.",
        "3. Develop healthy coping mechanisms, such as mindfulness meditation and physical exercise.",
        "4. Address underlying issues through therapy, like past trauma or unresolved conflicts.",
        "5. Consult with a mental health professional for a tailored treatment plan."
      ],
    },
    {
      'name': 'Phobic Anxiety',
      'details':
          'Phobic anxiety is a type of anxiety disorder characterized by an excessive and persistent fear of a specific object, situation, or activity.',
      'remedies': [
        "1. Exposure therapy to gradually expose individuals to the feared object or situation in a controlled and safe manner.",
        "2. Cognitive-behavioral strategies to identify and challenge irrational thoughts and beliefs associated with the phobia.",
        "3. Medications generally not the first-line treatment but may be prescribed for short-term relief.",
        "4. Seek guidance from a mental health professional for personalized treatment."
      ],
    },
    {
      'name': 'Paranoid Ideation',
      'details':
          'Paranoid ideation is a type of thought pattern characterized by excessive and irrational suspicion or mistrust of others.',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge irrational or exaggerated paranoid thoughts.",
        "2. Medications such as antipsychotics or mood stabilizers for severe symptoms.",
        "3. Create a supportive and nonjudgmental social network.",
        "4. Reduce stress through relaxation techniques, exercise, and a healthy lifestyle.",
        "5. Consult with a mental health specialist for a tailored treatment plan."
      ],
    },
    {
      'name': 'Psychoticism',
      'details':
          'Psychoticism is a personality trait characterized by a lack of empathy, impulsivity, aggression, and unconventional beliefs and behaviors.',
      'remedies': [
        "1. Antipsychotic medications prescribed by a healthcare provider for severe symptoms.",
        "2. Psychotherapy, particularly cognitive-behavioral therapy for psychosis (CBTp), to manage distressing beliefs and improve coping strategies.",
        "3. Build a strong support system with family and friends.",
        "4. Maintain a stable daily routine, avoid substance abuse, and manage stress through relaxation techniques.",
        "5. Regular follow-up with a mental health specialist to monitor progress."
      ],
    },
  ];

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text("Details"),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/main-bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(16.0),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.blue,
                      highlightColor: Colors.lightBlueAccent,
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    illnessData[widget.index]['details'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.blue,
                      highlightColor: Colors.lightBlueAccent,
                      child: Text(
                        "Remedies",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: illnessData[widget.index]['remedies']
                        .map<Widget>((remedy) => ListTile(
                              leading: Icon(Icons.check_circle),
                              title: Text(remedy),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
