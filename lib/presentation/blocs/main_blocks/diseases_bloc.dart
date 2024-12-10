
import 'package:flutter/material.dart';

class DiseasesBlock extends StatelessWidget {
  const DiseasesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> diseases = [
      {
        'name': 'Common Cold',
        'icon': '🤒',
      },
      {
        'name': 'Allergies', 
        'icon': '🤧',
      },
      {
        'name': 'Fever',
        'icon': '🤒',
      },
      // More can be added
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          const Text(
            'Common Diseases',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: diseases.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    // Open disease details page
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        diseases[index]['icon']!,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        diseases[index]['name']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}