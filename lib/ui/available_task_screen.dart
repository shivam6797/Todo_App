import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AvailabelTaskScreen extends StatefulWidget {
  const AvailabelTaskScreen({super.key});

  @override
  State<AvailabelTaskScreen> createState() => _AvailabelTaskScreenState();
}

class _AvailabelTaskScreenState extends State<AvailabelTaskScreen> {
  List<Map<String, dynamic>> tasks = [
    {
      "image": "assets/images/boy_3d_image.jpg",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/girl_image.png",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_latest.png",
      "title": "User Profile Enhancement",
      "assignee": "Michael Lee",
      "isChecked": false
    },
    {
      "image": "assets/images/girl_image.png",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_latest.png",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
    {
      "image": "assets/images/girl_image.png",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_latest.png",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
    {
      "image": "assets/images/girl_image.png",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_latest.png",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
    {
      "image": "assets/images/girl_image.png",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_3d_image.jpg",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_3d_image.jpg",
      "title": "Job Matching Optimization",
      "assignee": "Jack Roberts",
      "isChecked": false
    },
    {
      "image": "assets/images/boy_3d_image.jpg",
      "title": "Employer Dashboard Upgrades",
      "assignee": "Ava Taylor",
      "isChecked": false
    },
  ];

  int? selectedIndex;

  void onTaskSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
            Text(
              "Objective",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 13, color: Colors.grey[700], height: 1.8),
                children: [
                  TextSpan(
                      text:
                          "Effectively manage and coordinate the tasks involved in the development and enhancement of the Rune.io job finder website. Ensure alignment with project goals, timelines, and quality standards.\n\n"),
                  TextSpan(
                    text:
                        "Collaborate with the design team to outline the requirements for the website redesign. Clearly define the visual elements, user interface improvements, and overall user experience enhancements.",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(top: 10, right: 10),
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Team",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500)),
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
                Spacer(),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 6.0,
                  percent: 0.6,
                  center: Text(
                    "60%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  progressColor: Color(0xfff26e56),
                  backgroundColor: Colors.grey[300]!,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Today's Tasks",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return buildTaskCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAvatar(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }

  Widget buildTaskCard(int index) {
    return GestureDetector(
      onTap: () => onTaskSelected(index),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 0.6),
              blurRadius: 0,
              spreadRadius: 0.6,
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
                radius: 15, backgroundImage: AssetImage(tasks[index]["image"])),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tasks[index]["title"],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Assignee: ${tasks[index]["assignee"]}",
                    style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Color(0xff49c2ce);
                  }
                  return Colors.white;
                },
              ),
              side: MaterialStateBorderSide.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(color: Colors.black, width: 1.5);
                }
                return BorderSide(color: Colors.black, width: 1.5);
              }),
              value: selectedIndex == index,
              onChanged: (value) => onTaskSelected(index),
            ),
          ],
        ),
      ),
    );
  }
}
