import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OngoingProcessScreen extends StatelessWidget {
  OngoingProcessScreen({super.key});
  final List<Map<String, dynamic>> ongoingTasks = [
    {"title": "Task Customization", "comments": 12},
    {"title": "Deadline Management", "comments": 12},
    {"title": "Networking Assistance", "comments": 12},
    {"title": "Data Security Assurance", "comments": 12},
    {"title": "Continuous Feedback Loop", "comments": 12},
  ];

  final List<Map<String, dynamic>> inProcessTasks = [
    {"title": "Application Tracking", "comments": 12},
    {"title": "Automated Job Alerts", "comments": 12},
    {"title": "Mobile Optimization", "comments": 12},
  ];

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
            // runSpacing: 15,
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
                  child: const Icon(FontAwesomeIcons.bell,
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
        padding: const EdgeInsets.only(left: 12.0, right: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Website for Rune.io",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team Members",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins"),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/boy_3d_image.jpg'),
                              radius: 13,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/girl_image.png'),
                              radius: 13,
                            ),
                          ),
                          Positioned(
                            left: 35,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/boy_image_todo.jpg'),
                              radius: 13,
                            ),
                          ),
                          Positioned(
                            left: 55,
                            child: CircleAvatar(
                              backgroundColor: Color(0xfffcc345),
                              radius: 13,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IntrinsicWidth(
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.only(top: 10, right: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffececec),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm),
                        SizedBox(width: 5),
                        Text("Deadline: ", style: TextStyle(fontSize: 12)),
                        Text("February 6",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0.8),
                        blurRadius: 0,
                        spreadRadius: 0.8,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search cards",
                      hintStyle:
                          TextStyle(color: Color(0xff777777), fontSize: 14),
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0.8),
                        blurRadius: 0,
                        spreadRadius: 0.8,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18),
                      VerticalDivider(
                        color: Colors.transparent.withOpacity(0.1),
                        thickness: 1.0,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategory("On going", Color(0xff5894f2)),
                SizedBox(width: 90),
                _buildCategory("In Process", Color(0xfffcc345)),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildTaskList(
                        ongoingTasks, Color(0xff5894f2),context),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTaskList(
                        inProcessTasks, Color(0xfffcc345),context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, Color color) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Map<String, dynamic>> tasks, Color dotColor, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemCount: tasks.length + 1,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == tasks.length) {
            return GestureDetector(
              onTap: () {},
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1.0,
                dashPattern: [2, 2],
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffececec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add, size: 20, color: Colors.white),
                  ),
                ),
              ),
            );
          }
          return IntrinsicHeight(
            child: Container(
              width: 140,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
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
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tasks[index]["title"],
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("${tasks[index]["comments"]} Comments",
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(backgroundColor: dotColor, radius: 4),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
