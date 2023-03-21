import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.text, this.image})
      : super(key: key);
  final String? image;
  final String text;
  final sizeReference = 700.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        shadowColor: Colors.grey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (image != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          image!,
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    text,
                    textAlign: TextAlign.center,
                    maxFontSize: 40,
                    minFontSize: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
