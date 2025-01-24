import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_images.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/presentation/sales_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ViknImages.appIcon), // Add your logo
                ),
                Image.asset(ViknImages.appName),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(ViknImages.avatarImg),
                ),
              ],
            ),
            Expanded(child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: ViknColors.dashboardCardBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          spacing: 20,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "SAR 2,78,000.00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "+21% than last month",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Revenue",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height / 3.8,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: true),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: true),
                                  lineBarsData: [
                                    LineChartBarData(
                                      isCurved: true,
                                      color: Colors.blue,
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF007FA7),
                                            Colors.black.withValues(alpha: 0.0),
                                            // Transparent black at the bottom
                                          ],
                                        ),
                                      ),
                                      spots: const [
                                        FlSpot(0, 0),
                                        FlSpot(1, 3),
                                        FlSpot(2, 1.5),
                                        FlSpot(3, 3.5),
                                        FlSpot(4, 3),
                                        FlSpot(5, 2.6),
                                        FlSpot(6, 2.1),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text("September 2023",style: TextStyle(
                                color: ViknColors.whiteColor
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(7, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: index == selectedIndex
                                          ? ViknColors.buttonColor
                                          : null,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "0${index + 1}",
                                        style: TextStyle(
                                          color: ViknColors.whiteColor,
                                          fontWeight: index == selectedIndex
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DashboardCard(
                  title: "Bookings",
                  subtitle2: "Reserved",
                  subtitle: "123",
                  icon: ViknImages.bookingImg,
                  color: ViknColors.bookingBackground,
                ),
                SizedBox(height: 12),
                DashboardCard(
                  title: "Invoices",
                  subtitle: "10,232.00",
                  subtitle2: "Rupees",
                  icon: ViknImages.invoiceImg,
                  color: ViknColors.invoiceCardBackground,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SalesListScreen()),
                    );
                  },
                ),
              ],),
            ),),

          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String icon;
  final Color color;
  final Function()? onTap;

  const DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    super.key,
    required this.subtitle2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0F0F0F),
            Color(0xFF0F0F0F),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Image.asset(icon),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style:  TextStyle(
                      color: ViknColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle2,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 80,
              width: 80,
                decoration: BoxDecoration(
                  color: ViknColors.forwardButtonBackground,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 25)),
          ),
        ],
      ),
    );
  }
}
