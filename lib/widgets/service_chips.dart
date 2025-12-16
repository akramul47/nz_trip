import 'package:flutter/material.dart';import '../config/theme.dart';

class ServiceOption {
  final String label;

  ServiceOption({required this.label});
}

class ServiceChips extends StatefulWidget {
  final Function(int) onChipSelected;
  final int selectedIndex;

  const ServiceChips({
    super.key,
    required this.onChipSelected,
    required this.selectedIndex,
  });

  @override
  State<ServiceChips> createState() => _ServiceChipsState();
}

class _ServiceChipsState extends State<ServiceChips> {
  final List<ServiceOption> _options = [
    ServiceOption(label: 'Flights'),
    ServiceOption(label: 'Hotels'),
    ServiceOption(label: 'Flights + Hotels'),
    ServiceOption(label: 'Transports'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(_options.length, (index) {
            bool isSelected = widget.selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: GestureDetector(
                onTap: () {
                  widget.onChipSelected(index);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.chipBackground
                        : const Color(0xFF1a237e).withOpacity(0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    _options[index].label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
