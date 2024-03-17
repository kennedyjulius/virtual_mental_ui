import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/feature_box.dart';
import 'package:virtual_assistance_2/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SpeechToText speechToText;
  late String lastWords;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    speechToText = SpeechToText();
    await speechToText.initialize();
  }

  /// Each time to start a speech recognition session
  Future<void> startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

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
            // This will make the app bar stay at the top even when scrolling down
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

                //suggestion list
                SlideInRight(
                  delay: Duration(milliseconds: 400),
                  child: FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: "You are Stronger than You Think",
                    descriptionText:
                        "This quote reminds you that you possess inner strength and resilience to overcome challenges.",
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                SlideInLeft(
                  delay: Durations.medium1,
                  child: FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: "Embrace Progress, Not Perfection",
                    descriptionText:
                        "Focus on making small steps forward rather than aiming for perfection, as progress is what matters most.",
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                SlideInRight(
                  delay: Durations.medium2,
                  child: FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    headerText: "Your Mental Health Matters",
                    descriptionText:
                        "Take time to prioritize your mental well-being, as it is essential for overall health and happiness.",
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _controller.text.isEmpty ? 60 : 0,
        child: BottomAppBar(
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        gapPadding: 8,
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                      fillColor: Colors.grey,
                      enabled: true,
                      prefixIcon: const Icon(Icons.emoji_emotions),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add your send message logic here
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission &&
              speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        child: const Icon(Icons.mic),
      ),
    );
  }
}
