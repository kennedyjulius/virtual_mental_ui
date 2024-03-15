// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/feature_box.dart';

class HomeSreeen extends StatefulWidget {
  const HomeSreeen({Key? key}) : super(key: key);

  @override
  State<HomeSreeen> createState() => _HomeSreeenState();
}

class _HomeSreeenState extends State<HomeSreeen> {
  late final SpeechToText speechToText;
  late String lastWords;

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
      appBar: AppBar(
        title: const Text("Allen the ChatBot"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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

            //chat bubble
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              margin:
                  const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.borderColor,
                ),
                borderRadius:
                    BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
              ),
              child: Text(
                "Good Afternoon, How can I help you with your Mental Health Today ?.",
                style: const TextStyle(
                  color: Pallete.mainFontColor,
                  fontSize: 25,
                ),
              ),
            ),

            //suggestion list
            FeatureBox(
              color: Pallete.firstSuggestionBoxColor,
              headerText: "You are Stronger than You Think",
              descriptionText:
                  "This quote reminds you that you possess inner strength and resilience to overcome challenges.",
            ),

            const SizedBox(
              height: 10,
            ),

            FeatureBox(
              color: Pallete.secondSuggestionBoxColor,
              headerText: "Embrace Progress, Not Perfection",
              descriptionText:
                  "Focus on making small steps forward rather than aiming for perfection, as progress is what matters most.",
            ),

            const SizedBox(
              height: 10,
            ),

            FeatureBox(
              color: Pallete.thirdSuggestionBoxColor,
              headerText: "Your Mental Health Matters",
              descriptionText:
                  "Take time to prioritize your mental well-being, as it is essential for overall health and happiness.",
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
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
