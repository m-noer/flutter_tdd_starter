import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key, this.notFoundText}) : super(key: key);

  final String? notFoundText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/empty.json',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 14),
            Text(
              notFoundText ?? 'No data found',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
