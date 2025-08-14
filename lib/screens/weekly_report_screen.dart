import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:weekly_report_app/widgets/Weekly_report_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class WeeklyReportScreen extends StatefulWidget {
  const WeeklyReportScreen({super.key});

  @override
  State<WeeklyReportScreen> createState() => _WeeklyReportScreenState();
}

class _WeeklyReportScreenState extends State<WeeklyReportScreen> {
  final PageController _pageController = PageController();

  void _previousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,                
              border: Border.all(color: Colors.grey, width: 1.5), 
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Diary',
              style: TextStyle(
                color: Colors.grey,     
                fontSize: 14,         
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Weekly ',
                    style: TextStyle(
                      color: Colors.black,    
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Report',
                    style: TextStyle(
                      color: Colors.red,      
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 1.5), 
              ),
              child: Icon(
                Icons.download,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],


      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '5 August - 13 August, 2025',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: const [
                HeartHealthSection(),
                NutritionReviewSection(),
                BodyMetricsSection(),
                OverallSummarySection(),
              ],
            ),
          ),
          BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.description, color: Colors.grey),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Menu Book')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.restaurant_menu, color: Colors.grey),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Nutrition / Healthy Food')),
                          );
                        },
                      ),
                      IconButton(
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.explore, color: Colors.pink),
                            const SizedBox(width: 4),
                            const Text(
                              'Find',
                              style: TextStyle(color: Colors.pink, fontSize: 14),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Search')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.wifi, color: Colors.grey),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Wifi')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.grid_view, color: Colors.grey),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profile')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Section 1: Heart Health
class HeartHealthSection extends StatelessWidget {
  const HeartHealthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your resting heart-rate has dropped',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Indicating improved cardiovascular heart. Keep it up!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14,),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 10,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 0.5,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 0.5,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                          if (value.toInt() >= 0 && value.toInt() < days.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                days[value.toInt()],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 10,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  minX: 0,
                  maxX: 7,
                  minY: 50,
                  maxY: 90,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 80),
                        FlSpot(1, 75),
                        FlSpot(2, 70),
                        FlSpot(3, 65),
                        FlSpot(4, 68),
                        FlSpot(5, 66),
                        FlSpot(6, 64),
                        FlSpot(7, 62),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.red.withOpacity(0.1),
                      ),
                    ),
                  ],
                  lineTouchData: const LineTouchData(enabled: false),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MetricBox(title: 'Peak Heart Rate', value: '145 BPM'),
                MetricBox(title: 'Avg Heart Rate', value: '80-120'),
                MetricBox(title: 'Stress', value: 'Low'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    final state =
                    context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._previousPage();
                  },
                ),
                const Text(
                  'Heart Health & Stress',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                    final state =
                    context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._nextPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TipCard(
              text:
              'Today you took 23% less calories than your average. Keep your protein intake to at least 80% of recommended value even if you are trying to lose weight.',
            ),
          ],
        ),
      ),
    );
  }
}
// Section 2: Nutrition Review
class NutritionReviewSection extends StatelessWidget {
  const NutritionReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your fat intake is higher than needed',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lowering it will support your weight loss journey',
              style: TextStyle(color: Colors.black54,fontSize: 14,),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 293, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 450, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 393, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 493, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 400, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 630, color: Colors.red, width: 18)]),
                    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 494, color: Colors.red, width: 18)]),
                  ],


                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                          return Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),

                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 630,
                        color: Colors.grey.shade400,
                        strokeWidth: 1,
                        dashArray: [5, 5],
                        label: HorizontalLineLabel(
                          show: true,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          labelResolver: (line) => 'Target Calories = 3153',
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(bottom: 4),
                        ),
                      ),
                      HorizontalLine(
                        y: 438,
                        color: Colors.grey.shade400,
                        strokeWidth: 1,
                        dashArray: [5, 5],
                        label: HorizontalLineLabel(
                          show: true,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          labelResolver: (line) => 'Avg Daily Calories = 450',
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(bottom: 4),
                        ),
                      ),
                    ],
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final value = rod.toY.toInt();
                        final target = 450;
                        final icon = value <= target ? '✓' : '×';
                        return BarTooltipItem(
                          icon,
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      },
                      tooltipPadding: const EdgeInsets.all(4),
                      tooltipMargin: 8,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  maxY: 1000,
                  minY: 100,
                ),
              ),
            ),


            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MetricBox(title: 'Protein Intake', value: '84%'),
                MetricBox(title: 'Fat Intake', value: '120%'),
                MetricBox(title: 'Carbs Intake', value: '95%'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    final state = context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._previousPage();
                  },
                ),
                const Text(
                  'Food Journal: Nutrition Review',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                    final state = context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._nextPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TipCard(
              text:
              'Today you took 23% less calories than your average. Keep your protein intake to at least 80% of recommended value even if you are trying to lose weight.',
            ),
          ],
        ),
      ),
    );
  }
}
// Section 3: Body Metrics
class BodyMetricsSection extends StatelessWidget {
  const BodyMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'You have gained weight unexpectedly',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Check your calorie intake and activity levels',
              style: TextStyle(color: Colors.black54,fontSize: 14,),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 220, // slightly taller for clearer labels
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1000, // more width so each month is spaced well
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: 40, // extra space for labels
                            getTitlesWidget: (value, meta) {
                              const months = [
                                'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                              ];
                              if (value.toInt() >= 0 && value.toInt() < months.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    months[value.toInt()],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 78),
                            FlSpot(1, 80),
                            FlSpot(2, 82),
                            FlSpot(3, 81),
                            FlSpot(4, 80),
                            FlSpot(5, 82),
                            FlSpot(6, 83),
                            FlSpot(7, 82.5),
                            FlSpot(8, 81.8),
                            FlSpot(9, 82.2),
                            FlSpot(10, 81.5),
                            FlSpot(11, 82),
                          ],
                          isCurved: true,
                          color: Colors.purple,
                          dotData: FlDotData(show: false),
                          barWidth: 3, // thicker line for clarity
                        ),
                      ],
                      minY: 78,
                      maxY: 84,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                MetricBox(title: 'Current Weight', value: '82 Kgs'),
                MetricBox(title: 'Current BMI', value: '28.6'),
                MetricBox(title: 'Body Fat', value: '22.6%'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    final state =
                    context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._previousPage();
                  },
                ),
                const Text(
                  'Body Metrics : Weight, BMI, Fat',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                    final state =
                    context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._nextPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TipCard(
              text:
              'Today you took 23% less calories than your average. Keep your protein intake to at least 80% of recommended value even if you are trying to lose weight.',
            ),
          ],
        ),
      ),
    );
  }
}


// Section 4: Overall Summary
class OverallSummarySection extends StatelessWidget {
  const OverallSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Hey Muniba, you did good!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Keep up the great work and stay consistent!',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 40),

            // CustomPaint-based FitScoreChart
            FitScoreChart(),

            const SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MetricBox(title: 'Peak Heart Rate', value: '145 BPM'),
                MetricBox(title: 'Current BMI', value: '28.6'),
                MetricBox(title: 'Calories Consumed', value: '2865/day'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    // This finds the state of the parent WeeklyReportScreen
                    final state = context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._previousPage();
                  },
                ),
                const Text(
                  'Overall Summary',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                    // This finds the state of the parent WeeklyReportScreen
                    final state = context.findAncestorStateOfType<_WeeklyReportScreenState>();
                    state?._nextPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TipCard(
              text: 'Today you took 23% less calories than your average. Keep your protein intake to at least 80% of recommended value even if you are trying to lose weight.',
            ),
          ],
        ),
      ),
    );
  }
}



class FitScoreChart extends StatelessWidget {
  const FitScoreChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Chart data
    final List<_FitScoreData> chartData = [
      _FitScoreData('Steps', 35, Colors.green),
      _FitScoreData('Activity', 30, Colors.amber),
      _FitScoreData('Sleep', 25, Colors.purple),
      _FitScoreData('Remaining', 10, Colors.grey.shade300),
    ];

    // Calculate cumulative angles for each segment
    double total = chartData.fold(0, (sum, item) => sum + item.value);
    int greenDeg = ((chartData[0].value / total) * 360).toInt();
    int amberDeg = ((chartData[1].value / total) * 360).toInt();
    int purpleDeg = ((chartData[2].value / total) * 360).toInt();
    int greyDeg = ((chartData[3].value / total) * 360).toInt();

    return SizedBox(
      width: 300, // Increased size
      height: 300, // Increased size
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfCircularChart(
            backgroundColor: Colors.transparent,
            series: <DoughnutSeries<_FitScoreData, String>>[
              // Green segment (start rounded)
              DoughnutSeries<_FitScoreData, String>(
                dataSource: [chartData[0]],
                xValueMapper: (data, _) => data.category,
                yValueMapper: (data, _) => data.value,
                pointColorMapper: (data, _) => data.color,
                innerRadius: '80%',
                radius: '92%',
                startAngle: 270,
                endAngle: 270 + greenDeg,
                cornerStyle: CornerStyle.startCurve,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
              ),
              // Amber segment (normal)
              DoughnutSeries<_FitScoreData, String>(
                dataSource: [chartData[1]],
                xValueMapper: (data, _) => data.category,
                yValueMapper: (data, _) => data.value,
                pointColorMapper: (data, _) => data.color,
                innerRadius: '80%',
                radius: '92%',
                startAngle: 270 + greenDeg,
                endAngle: 270 + greenDeg + amberDeg,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                cornerStyle: CornerStyle.bothFlat,
              ),
              // Purple segment (end rounded)
              DoughnutSeries<_FitScoreData, String>(
                dataSource: [chartData[2]],
                xValueMapper: (data, _) => data.category,
                yValueMapper: (data, _) => data.value,
                pointColorMapper: (data, _) => data.color,
                innerRadius: '80%',
                radius: '92%',
                startAngle: 270 + greenDeg + amberDeg,
                endAngle: 270 + greenDeg + amberDeg + purpleDeg,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                cornerStyle: CornerStyle.endCurve,
              ),
              // Grey segment (smaller, normal)
              DoughnutSeries<_FitScoreData, String>(
                dataSource: [chartData[3]],
                xValueMapper: (data, _) => data.category,
                yValueMapper: (data, _) => data.value,
                pointColorMapper: (data, _) => data.color,
                innerRadius: '90%',
                radius: '85%',
                startAngle: 270 + greenDeg + amberDeg + purpleDeg,
                endAngle: 270 + greenDeg + amberDeg + purpleDeg + greyDeg,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                cornerStyle: CornerStyle.bothFlat,
              ),
            ],
          ),
          // Center text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'FIT Score',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '80',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Positioned text labels for chart segments (values adjusted for new size)
          Positioned(
            top: -2,
            right: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Steps',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold ,fontSize: 11.5),
                ),
                Text(
                  '9,266',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 11.5),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: -6.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Workouts',
                  style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold,fontSize: 11.5,),
                ),
                Text(
                  '200 mins',
                  style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold,fontSize: 11.5,),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -2,
            right: 189,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Sleep',
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 11.5),
                ),
                Text(
                  '45 Hours',
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 11.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Model class
class _FitScoreData {
  final String category;
  final double value;
  final Color color;

  const _FitScoreData(this.category, this.value, this.color);
}