import 'package:flutter/material.dart';

class ProvidersScreen extends StatelessWidget {
  const ProvidersScreen({super.key});

  // Provider list: change logos to match files you placed in assets/logos/
  final List<Map<String, String>> _providers = const [
    {"name": "MTN", "logo": "assets/logos/mtn.png"},
    {"name": "Roshan", "logo": "assets/logos/roshan.png"},
    {"name": "Etisalat", "logo": "assets/logos/etisalat.png"},
    {"name": "Salam", "logo": "assets/logos/salam.png"},
    {"name": "Awcc", "logo": "assets/logos/awcc.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب سیمکارت'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: _providers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final p = _providers[index];
            return GestureDetector(
              onTap: () {
                // open bundles and pass provider name
                Navigator.pushNamed(context, '/bundles', arguments: p['name']);
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo — make sure assets exist and are declared in pubspec
                    SizedBox(
                      height: 72,
                      child: p['logo'] != null
                          ? Image.asset(p['logo']!, fit: BoxFit.contain)
                          : const Icon(Icons.sim_card, size: 56),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      p['name'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
