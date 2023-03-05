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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      image!,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 40),
                  maxFontSize: 40,
                  minFontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
