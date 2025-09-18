import 'package:flutter/material.dart';

class BundlesScreen extends StatelessWidget {
  final String providerName;
  const BundlesScreen({super.key, required this.providerName});

  // Categories list
  final List<Map<String, dynamic>> _categories = const [
    {"title": "بسته های پیام", "icon": Icons.email},
    {"title": "بسته های انترنتی", "icon": Icons.wifi},
    {"title": "خدمات", "icon": Icons.settings},
    {"title": "بسته های تماس", "icon": Icons.call},
    {"title": "بسته های بین المللی", "icon": Icons.language},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(providerName), backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: _categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final category = _categories[index];
            return GestureDetector(
              onTap: () {
                // Navigate to details page for each category
                Navigator.pushNamed(
                  context,
                  '/bundleDetails',
                  arguments: {
                    'providerName': providerName,
                    'bundle': {
                      "title": category['title'],
                      "price": "N/A",
                      "description": "Details for ${category['title']}",
                      "activation": "*123#",
                      "deactivation": "STOP",
                    },
                  },
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category['icon'], size: 48, color: Colors.indigo),
                    const SizedBox(height: 10),
                    Text(
                      category['title'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
