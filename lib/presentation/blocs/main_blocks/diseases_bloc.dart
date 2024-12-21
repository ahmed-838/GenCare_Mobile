import 'package:flutter/material.dart';

class DiseasesBlock extends StatefulWidget {
  const DiseasesBlock({super.key});

  @override
  State<DiseasesBlock> createState() => _DiseasesBlockState();
}

class _DiseasesBlockState extends State<DiseasesBlock> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> diseases = [
      {
        'name': 'Common Cold',
        'icon': '🤒',
        'description': 'Upper respiratory tract infection with symptoms like sneezing and coughing',
      },
      {
        'name': 'Allergies', 
        'icon': '🤧',
        'description': 'Immune response to certain substances causing symptoms like sneezing and itching',
      },
      {
        'name': 'Fever',
        'icon': '🤒',
        'description': 'Elevated body temperature accompanied by fatigue and general weakness',
      },
      // More can be added
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left side - Disease cards (40% width)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: diseases.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        elevation: 4,
                        child: InkWell(
                          onTap: () {
                            // Open disease details page
                          },
                          child: Column(
                            children: [
                              // Header Section
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      diseases[index]['icon']!,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        diseases[index]['name']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Body Section
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                child: Text(
                                  diseases[index]['description']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Right side - GIF image
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/doctor.gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}