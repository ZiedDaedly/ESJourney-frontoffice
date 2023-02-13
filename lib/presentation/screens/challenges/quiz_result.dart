import 'dart:ui';

import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool test = false;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: width * 0.5,
                  width: width * 0.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: test
                              ? theme.colorScheme.outline.withOpacity(0.1)
                              : theme.colorScheme.primary.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: width * 0.4,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: test
                        ? theme.colorScheme.outline
                        : theme.colorScheme.primary,
                  ),
                  child: Center(
                    child: Icon(
                      test ? Icons.check : Icons.close,
                      color: theme.colorScheme.onPrimary,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(test ? "Congratulations!" : "Oops!",
                style: TextStyle(
                  fontFamily: 'VisbyRoundCF',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.outline,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        test
                            ? "You have completed the quiz!"
                            : "Looks like you didn't win this time.",
                        style: TextStyle(
                          fontFamily: 'VisbyRoundCF',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.secondary,
                        )),
                    Visibility(
                      visible: !test,
                      child: Text("Keep practicing to improve your skills!",
                          style: TextStyle(
                            fontFamily: 'VisbyRoundCF',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.secondary,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text("Your Score",
                style: TextStyle(
                  fontFamily: 'VisbyRoundCF',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.outline,
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Text("8/10",
                style: TextStyle(
                  fontFamily: 'VisbyRoundCF',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.secondary,
                )),
            SizedBox(
              height: height * 0.07,
            ),
            Row(
              mainAxisAlignment: test
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                QuizResultOption(
                  theme: theme,
                  icon: Icons.home_outlined,
                  text: "Home",
                  width: width,
                ),
                Visibility(
                    visible: !test, child: SizedBox(width: width * 0.05)),
                QuizResultOption(
                  theme: theme,
                  icon: test
                      ? Icons.remove_red_eye_outlined
                      : Icons.refresh_outlined,
                  text: test ? "Review Answer" : "Try Again",
                  width: width,
                ),
                Visibility(
                  visible: test,
                  child: QuizResultOption(
                    theme: theme,
                    icon: Icons.leaderboard_outlined,
                    text: "Leaderboard",
                    width: width,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultOption extends StatelessWidget {
  const QuizResultOption({
    super.key,
    required this.theme,
    required this.icon,
    required this.text,
    required this.width,
    this.onTap,
  });

  final ThemeData theme;

  final double width;
  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width * 0.2, height: width * 0.2, // circular border
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(
                width * 0.2,
              ),
            ),

            child: Center(
              child: Icon(
                icon,
                color: theme.colorScheme.background,
                size: width * 0.08,
              ),
            ),
          ),
        ),
        SizedBox(
          height: width * 0.03,
        ),
        Text(text,
            style: TextStyle(
              fontFamily: 'VisbyRoundCF',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary,
            ))
      ],
    );
  }
}