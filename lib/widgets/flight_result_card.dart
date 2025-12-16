import 'package:flutter/material.dart';

import '../config/theme.dart';

class FlightResultCard extends StatelessWidget {
  const FlightResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade300, Colors.white],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Cheapest',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '*Instant Purchase',
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildFlightRow(
                  time: '2:40 PM',
                  code: 'KUL',
                  date: '10 Sep, 2024, Saturday',
                  duration: '4h 25m',
                  endTime: '4:05 PM',
                  endCode: 'MLE',
                  isOutbound: true,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1),
                ),
                _buildFlightRow(
                  time: '11:15 AM',
                  code: 'MLE',
                  date: '15 Sep, 2024, Saturday',
                  duration: '4h 25m',
                  endTime: '6:55 PM',
                  endCode: 'KUL',
                  isOutbound: false,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.primary,
                  Colors.blue.shade800,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(3, 134, 255, 1),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Flight Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: 3,
                  height: 3,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Non-Refundable',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(width: 8),
                // Container(
                //   width: 1,
                //   height: 12,
                //   color: Colors.white,
                // ),
                const SizedBox(width: 4),
                const Row(
                  children: [
                    Icon(
                      Icons.event_seat,
                      color: Colors.white,
                      size: 9,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Seats 5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'MYR 2240',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightRow({
    required String time,
    required String code,
    required String date,
    required String duration,
    required String endTime,
    required String endCode,
    required bool isOutbound,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   padding: const EdgeInsets.all(6),
        //   decoration: BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.circular(6),
        //   ),
        //   child: const Column(
        //     children: [
        //       Icon(
        //         Icons.flight,
        //         color: Colors.white,
        //         size: 16,
        //       ),
        //       SizedBox(height: 2),
        //       Text(
        //         'EK - 343',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 9,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        const Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              foregroundImage: AssetImage(
                'assets/images/Emirates_logo.png',
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'EK - 343',
              style: TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          code,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Departure - ${code == 'KUL' ? 'Kuala Lumpur' : 'Male City'}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(
                    isOutbound ? Icons.flight_takeoff : Icons.flight_land,
                    size: 16,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.luggage,
                        size: 12,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '35 kg',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          endCode,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          endTime,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Departure - ${endCode == 'KUL' ? 'Kuala Lumpur' : 'Male City'}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Add the LoadingLogo widget
class LoadingLogo extends StatelessWidget {
  const LoadingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final logoSize = screenSize.width * 0.25;
    final topPadding = screenSize.height * 0.25;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: topPadding,
          ),
          Image.asset(
            'assets/images/splash_logo.png',
            height: logoSize,
          ),
        ],
      ),
    );
  }
}
