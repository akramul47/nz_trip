import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/flight_info_widget.dart';
import '../widgets/flight_result_card.dart';

class FlightResultsScreen extends StatefulWidget {
  const FlightResultsScreen({super.key});

  @override
  State<FlightResultsScreen> createState() => _FlightResultsScreenState();
}

class _FlightResultsScreenState extends State<FlightResultsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isLoading
                ? const [
                    Color.fromRGBO(3, 134, 255, 0.5),
                    Color.fromRGBO(8, 3, 255, 0.3)
                  ]
                : [Colors.grey.shade100, Colors.grey.shade50],
          ),
        ),
        child: Column(
          children: [
            // Flight Info Widget at the top
            const FlightInfoWidget(),

            // Main Content
            Expanded(
              child: _isLoading
                  ? const LoadingLogo()
                  : CustomScrollView(
                      slivers: [
                        // Search info and filters
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Search Refresh',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '14:06',
                                          style: TextStyle(
                                            color: Colors.blue.shade700,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 10,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.filter_alt_outlined,
                                            size: 16,
                                            color: Colors.grey.shade700,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Filter Search',
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  '267 Cheapest Flights Found',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Horizontal line
                        SliverToBoxAdapter(
                          child: Container(
                            height: 1,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            color: Colors.grey.shade300,
                          ),
                        ),
                        // Flight results list
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => const FlightResultCard(),
                              childCount: 5,
                            ),
                          ),
                        ),
                        const SliverPadding(
                          padding: EdgeInsets.only(bottom: 24),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
