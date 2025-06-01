import 'package:flutter/material.dart';

class EmailValid extends StatelessWidget {
  final int breaches;
  final double score;
  const EmailValid({super.key, required this.breaches, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350,
        maxHeight: 227),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
               Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 28),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Text(
                      "Email is Valid!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                const SizedBox(height: 16),
                Text(
                  "🔐 Breaches: $breaches",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  "📊 Score: ${score.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
