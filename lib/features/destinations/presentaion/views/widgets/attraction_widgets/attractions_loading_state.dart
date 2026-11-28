import 'package:flutter/material.dart';

class AttractionsLoadingState extends StatelessWidget {
  const AttractionsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(color: Color(0xFF426B50)),
            SizedBox(height: 16),
            Text('Discovering attractions...'),
          ],
        ),
      ),
    );
  }
}
