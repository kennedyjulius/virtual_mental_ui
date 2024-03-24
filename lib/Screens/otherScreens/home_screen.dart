import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/feature_box.dart';
import 'package:virtual_assistance_2/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _bottomTextFieldController = TextEditingController();

  // List of topics
  List<String> topics = [
    "You are Stronger than You Think",
    "Embrace Progress, Not Perfection",
    "Your Mental Health Matters",
    // Add more topics as needed
  ];

  // Selected topic
  String? selectedTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: BounceInDown(child: const Text("Allen the ChatBot")),
            centerTitle: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ZoomIn(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Pallete.assistantCircleColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        height: 123,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage("assets/virtualAssistant.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //chat bubble
                SlideInLeft(
                  delay: Durations.long1,
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 40)
                        .copyWith(top: 30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Pallete.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(20)
                          .copyWith(topLeft: Radius.zero),
                    ),
                    child: const Text(
                      "Good Afternoon, How can I help you with your Mental Health Today ?.",
                      style: TextStyle(
                        color: Pallete.mainFontColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),

                // Filter Chips
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: topics
                        .map(
                          (topic) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FilterChip(
                              label: Text(topic),
                              selected: selectedTopic == topic,
                              onSelected: (selected) {
                                setState(() {
                                  selectedTopic = selected ? topic : null;
                                });
                                if (selected) {
                                  // Forward the selected topic to the backend
                                  _sendTopicToBackend(topic);
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 10),

                // Suggestion Boxes
                SlideInRight(
                  delay: Duration(milliseconds: 400),
                  child: FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: "You are Stronger than You Think",
                    descriptionText:
                        "This quote reminds you that you possess inner strength and resilience to overcome challenges.",
                  ),
                ),

                const SizedBox(height: 10),

                SlideInLeft(
                  delay: Durations.medium1,
                  child: FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: "Embrace Progress, Not Perfection",
                    descriptionText:
                        "Focus on making small steps forward rather than aiming for perfection, as progress is what matters most.",
                  ),
                ),

                const SizedBox(height: 10),

                SlideInRight(
                  delay: Durations.medium2,
                  child: FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    headerText: "Your Mental Health Matters",
                    descriptionText:
                        "Take time to prioritize your mental well-being, as it is essential for overall health and happiness.",
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          // Add your logic for speech to text here
        },
        child: const Icon(Icons.mic),
      ),
      bottomNavigationBar: Container(
        color: Pallete.firstSuggestionBoxColor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _bottomTextFieldController,
                decoration: const InputDecoration(
                  hintText: 'Enter your message...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Add your send message logic here
                print('Send Button Pressed');
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  // Function to send the selected topic to the backend
  void _sendTopicToBackend(String topic) {
    // Add your logic to send the selected topic to the backend here
    print('Selected topic: $topic');
  }
}
