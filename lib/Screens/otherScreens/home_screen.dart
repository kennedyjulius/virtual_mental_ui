// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/feature_box.dart';

class HomeSreeen extends StatelessWidget {
  const HomeSreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allen ChatBot"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/virtualAssistant.png"))),
                ),
              ],
            ),
        
            //chat bubble
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.borderColor,
                ),
                borderRadius:
                    BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
              ),
              child: Text(
                "Good Afternoon, How can I help you with your Mental Health Today ?.",
                style: TextStyle(
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
                    "This quote reminds you that you possess inner strength and resilience to overcome challenges."),
        
            SizedBox(
              height: 10,
            ),
        
            FeatureBox(
                color: Pallete.secondSuggestionBoxColor,
                headerText: "Embrace Progress, Not Perfection",
                descriptionText:
                    "Focus on making small steps forward rather than aiming for perfection, as progress is what matters most."),
        
            SizedBox(
              height: 10,
            ),
        
            FeatureBox(
                color: Pallete.thirdSuggestionBoxColor,
                headerText: "Your Mental Health Matters",
                descriptionText:
                    "Take time to prioritize your mental well-being, as it is essential for overall health and happiness."),
        
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: 
      () {
        
      },
      child: Icon(Icons.mic),
      ),
    );
  }
}
