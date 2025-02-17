import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskOverviewScreen extends StatelessWidget {
  const TaskOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        leadingWidth: 55,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 35,
            width: 45,
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Color(0xffececec),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(FontAwesomeIcons.chevronLeft,
                size: 16, color: Colors.black),
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.only(top: 10, right: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(FontAwesomeIcons.calendarCheck,
                      size: 16, color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.only(top: 10, right: 13, bottom: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(FontAwesomeIcons.ellipsisVertical,
                      size: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Task Overview",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _taskCard("In Process", FontAwesomeIcons.clock, "12 Tasks",
                      Color(0xffffc348)),
                  _taskCard("Completed", FontAwesomeIcons.fileCircleCheck,
                      "42 Tasks", Color(0xff52c1c5)),
                ],
              ),
              const SizedBox(height: 16),
              _chartCard("Daily tasks overview", _buildLineChart(), "", false),
              const SizedBox(height: 16),
              _chartCard("Project overview", _buildBarChart(),
                  "Avg Project daily", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskCard(
    String title,
    IconData? icon,
    String count,
    Color color,
  ) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent.withOpacity(0.1),
            child: Icon(
              icon,
              color: Colors.white,
              size: 17,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              Text(count, style: const TextStyle(fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }

  Widget _chartCard(
      String title, Widget chart, String? subtitle, bool? isTrue) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 0.8),
            blurRadius: 0,
            spreadRadius: 0.8,
            blurStyle: BlurStyle.outer,
          ),
        ],
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 15, top: 14, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      isTrue == true
                          ? Text(
                              subtitle.toString(),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            )
                          : Container()
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Weekly", style: TextStyle(fontSize: 12)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Icon(
                            FontAwesomeIcons.caretDown,
                            size: 12,
                          ),
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 22),
            chart,
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Color(0xffffc348), "In Process"),
                const SizedBox(width: 16),
                _buildLegendItem(Color(0xff52c1c5), "Completed"),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black, width: 1.0)),
        ),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildLineChart() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(
        right: 20,
      ),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Color(0xff52c1c5).withOpacity(0.2),
            ),
            touchCallback:
                (FlTouchEvent event, LineTouchResponse? touchResponse) {
              if (!event.isInterestedForInteractions || touchResponse == null) {
                return;
              }
            },
            handleBuiltInTouches: true,
          ),
          minY: 0,
          maxY: 8,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            checkToShowHorizontalLine: (value) {
              return value == 0 ||
                  value == 2 ||
                  value == 4 ||
                  value == 6 ||
                  value == 8;
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              );
            },
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 0,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 2,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 4,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 6,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 8,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
            ],
          ),
          borderData: FlBorderData(
              show: false, border: Border.all(color: Colors.transparent)),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 2,
                getTitlesWidget: (value, _) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "${value.toInt()}",
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 1,
                getTitlesWidget: (value, _) {
                  List<String> days = [
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat",
                    "Sun"
                  ];
                  if (value.toInt() >= 0 && value.toInt() < days.length) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 6.0, left: 15),
                      child: Text(days[value.toInt()],
                          style: TextStyle(fontSize: 10)),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(show: false),
              spots: [
                FlSpot(0, 2),
              FlSpot(1, 4),
              FlSpot(2, 3),
              FlSpot(3, 6),
              FlSpot(4, 7),
              FlSpot(5, 5),
              FlSpot(6, 4),
              ],
              isCurved: true,
              color: Color(0xffffc348),
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: false,
                color: Color(0xffffc348),
              ),
            ),
            LineChartBarData(
              dotData: FlDotData(show: false),
              spots: [
                FlSpot(0, 3),
              FlSpot(1, 2),
              FlSpot(2, 5),
              FlSpot(3, 6),
              FlSpot(4, 6),
              FlSpot(5, 7),
              FlSpot(6, 3),
              ],
              isCurved: true,
              color: Color(0xff52c1c5),
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: false,
                color: Color(0xff52c1c5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(left: 12, right: 15),
      child: BarChart(
        BarChartData(
          minY: 0,
          maxY: 8,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            checkToShowHorizontalLine: (value) {
              return value == 0 ||
                  value == 2 ||
                  value == 4 ||
                  value == 6 ||
                  value == 8;
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              );
            },
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 0,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 2,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 4,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 6,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
              HorizontalLine(
                y: 8,
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 0.8,
              ),
            ],
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 16,
                interval: 2,
                getTitlesWidget: (value, _) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (value, _) {
                  List<String> days = [
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat",
                    "Sun"
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      days[value.toInt()],
                      style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.normal),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  toY: 4.9,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  toY: 6.1,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  toY: 4.9,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  toY: 7.2,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                  toY: 4.9,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                  toY: 3,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                  toY: 4,
                  color: Color(0xfff26d59),
                  width: 14,
                  borderRadius: BorderRadius.circular(4))
            ]),
          ],
        ),
      ),
    );
  }
}
