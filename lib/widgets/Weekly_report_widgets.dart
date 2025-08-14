import 'package:flutter/material.dart';

class MetricBox extends StatelessWidget {
  final String title;
  final String value;

  const MetricBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String text;

  const TipCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final boldPhrases = [
      '23% less calories',
      'protein intake to at least 80%',
    ];

    final pattern = RegExp(
      '(${boldPhrases.map(RegExp.escape).join('|')})',
      caseSensitive: false,
    );

    final spans = <InlineSpan>[];
    text.splitMapJoin(
      pattern,
      onMatch: (match) {
        spans.add(TextSpan(
          text: match.group(0),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ));
        return '';
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(
          text: nonMatch,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
        ));
        return '';
      },
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(children: spans),
      ),
    );
  }
}
