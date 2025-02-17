import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          leadingWidth: 60,
          titleSpacing: 2,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 48,
              height: 48,
              margin: EdgeInsets.only(left: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage('assets/images/boy_3d_image.jpg'),
                  fit: BoxFit.contain, // Ensures it covers the entire circle
                  alignment: Alignment.center, // Centers the image
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Bruce 👋",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Your daily adventure starts now",
                style: TextStyle(fontSize: 12, color: Color(0XFF868686)),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.ROUTE_NOTIFICATION);
              },
              child: Container(
                height: 35,
                width: 45,
                margin: EdgeInsets.only(right: 15, top: 10, bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.grid_view, size: 18, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Task Status Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard("On going", "24 Tasks", Colors.blue,
                      FontAwesomeIcons.rotate, Color(0xff5594f1), () {
                      }),
                  _buildStatusCard("In Process", "12 Tasks", Colors.orange,
                      FontAwesomeIcons.clock, Color(0xfffdc546), () {}),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard(
                      "Completed",
                      "42 Tasks",
                      Colors.teal,
                      FontAwesomeIcons.fileCircleCheck,
                      Color(0xff52c1c5),
                      () {
                        Navigator.pushNamed(context, AppRoutes.ROUTE_AVAILABEL_TASK);
                      }),
                  _buildStatusCard("Canceled", "8 Tasks", Colors.red,
                      FontAwesomeIcons.fileExcel, Color(0xfff26e56), () {}),
                ],
              ),

              SizedBox(height: 20),
              Text(
                "Recent Task",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Task List
              Expanded(
                child: ListView(
                  children: [
                    _buildTaskCard(
                        "Website for Rune.io",
                        "Digital Product Design",
                        0.4,
                        Color(0xfff26e56),
                        context),
                    _buildTaskCard(
                        "Dashboard for ProSavvy",
                        "Digital Product Design",
                        0.75,
                        Color(0xff52c1c5),
                        context),
                    _buildTaskCard(
                        "Mobile Apps for Track.id",
                        "Digital Product Design",
                        0.5,
                        Color(0xfffdc546),
                        context),
                    _buildTaskCard(
                        "Website for CourierGo.com",
                        "Digital Product Design",
                        0.4,
                        Color(0xff5594f1),
                        context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String tasks, Color color,
      IconData icon, Color colors, VoidCallback? ontap) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(left: 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent.withOpacity(0.1)),
                child: Icon(
                  icon,
                  size: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13)),
                  // SizedBox(height:2),
                  Text(tasks,
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, double progress,
      Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.ROUTE_TASK_OVERVIEW);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black, // Black shadow with some transparency
                offset: Offset(0, 1), // Horizontal and vertical shadow offset
                blurRadius: 0, // How soft the shadow is
                spreadRadius: 1,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.circleCheck,
                          size: 14, color: Colors.black),
                      SizedBox(width: 4),
                      Text("12 Tasks",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              percent: progress,
              backgroundColor: Colors.transparent.withOpacity(0.1),
              center: Text(
                "${(progress * 100).toInt()}%",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              progressColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
