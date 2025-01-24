import 'package:flutter/material.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedPeriod = 'This Month';
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();
  String? selectedCustomer;
  List<String> selectedStatuses = ['Pending'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.visibility_outlined,
            color: ViknColors.buttonColor,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Filter',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: ViknColors.filterButtonBackground,
              height: 24,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: ViknColors.filterButtonBackground,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedPeriod,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Date Range
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ViknColors.filterButtonBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_sharp,
                              color: ViknColors.buttonColor, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '12/09/2023',
                            style: TextStyle(
                                color: ViknColors.whiteColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ViknColors.filterButtonBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_sharp,
                              color: ViknColors.buttonColor, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '12/09/2023',
                            style: TextStyle(
                                color: ViknColors.whiteColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ViknColors.filterButtonBackground,
              height: 24,
            ),

            // Status Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterStatus(
                  title: "Pending",
                  isSelected: true,
                ),
                FilterStatus(title: "Invoiced"),
                FilterStatus(title: "Cancelled"),
              ],
            ),
            const SizedBox(height: 24),

            // Customer Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              decoration: BoxDecoration(
                // color: ViknColors.filterButtonBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ViknColors.filterButtonBackground,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Customer',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(15),
width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ViknColors.filterButtonBackground,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'savad farooque',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.close, size: 18, color: Colors.white)
                ],
              ),
                  ),
          ],
        ),
      ),
    );
  }
}

class FilterStatus extends StatelessWidget {
  final bool? isSelected;
  final String title;

  const FilterStatus({
    super.key,
    required this.title,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? ViknColors.buttonColor
            : ViknColors.filterButtonBackground,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
