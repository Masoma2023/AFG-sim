import 'package:flutter/material.dart';

class BundleDetailsScreen extends StatefulWidget {
  final String providerName;
  final Map<String, dynamic> bundle;

  const BundleDetailsScreen({
    super.key,
    required this.providerName,
    required this.bundle,
  });

  @override
  State<BundleDetailsScreen> createState() => _BundleDetailsScreenState();
}

class _BundleDetailsScreenState extends State<BundleDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = ["روزانه", "هفته ای", "ماهانه", "ترکیبی"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bundle["title"] ?? "جزئیات بسته"),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return _buildBundleCard(
            title: widget.bundle["title"] ?? "بسته $tab",
            price: widget.bundle["price"] ?? "30 افغانی",
            description:
                widget.bundle["description"] ??
                "جزئیات برای $tab بسته در ${widget.providerName}",
            activation: widget.bundle["activation"] ?? "*123#",
            deactivation: widget.bundle["deactivation"] ?? "STOP",
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBundleCard({
    required String title,
    required String price,
    required String description,
    required String activation,
    required String deactivation,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.orange,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Price
              Chip(label: Text(price), backgroundColor: Colors.blue.shade100),
              const SizedBox(height: 12),

              // Description
              Text(description, style: const TextStyle(fontSize: 14)),
              const Spacer(),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: implement activation logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("فعال شد: $activation")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("فعال سازی"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: implement deactivation logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("غیر فعال شد: $deactivation")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("غیر فعال سازی"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
