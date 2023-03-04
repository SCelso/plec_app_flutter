import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.text}) : super(key: key);
  final String text;
  final sizeReference = 700.0;

  double getResponsiveText(double size, BuildContext context) =>
      size * sizeReference / MediaQuery.of(context).size.longestSide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        shadowColor: Colors.grey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 40),
                maxFontSize: 40,
                minFontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
