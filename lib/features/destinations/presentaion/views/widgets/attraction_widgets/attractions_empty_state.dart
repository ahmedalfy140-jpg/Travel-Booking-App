import 'package:flutter/material.dart';

class AttractionsEmptyState extends StatelessWidget {
  const AttractionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            Icon(
              Icons.travel_explore_rounded,
              size: 55,
              color: Color(0xFF426B50),
            ),
            SizedBox(height: 12),
            Text(
              'No attractions found',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'We couldn\'t find attractions for this destination.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
