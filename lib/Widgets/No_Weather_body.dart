import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: const Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There is no Weather 😔 Start'
            ,style: TextStyle(fontSize: 26),),
            Text('Searching Now 🔎',
            style: TextStyle(fontSize: 26),)
          ],
        ),
      ),
    );
  }
}
