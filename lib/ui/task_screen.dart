import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskScreen extends StatefulWidget {

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int selectedIndex = 3;
  final List<String> timeSlots = [
    "09 am",
    "10 am",
    "11 am",
    "12 am",
    "01 pm",
    "02 pm",
    "03 pm",
    "04 pm"
  ];

  final List<Map<String, dynamic>> tasks = [
    {
      "time": "09 am",
      "title": "Optimize server response time.",
      "duration": "09.00 am - 10.15 am"
    },
    {
      "time": "11 am",
      "title": "Team Meeting\n(Designer and Developer)",
      "duration": "10.45 am - 11.45 am",
      "subtitle":"Optimization Website for Rune.io",
      "avatars": [
        "assets/images/googles_boy.png",
        "assets/images/girl_image.png",
        "assets/images/boy_latest.png"
      ]
    },
    {"time": "02 pm", "title": "Add new subtask", "isSubtask": true},
    {
      "time": "03 pm",
      "title": "Optimize Homepage\nDesign",
      "duration": "03.00 pm - 04.15 pm"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
        leading:  Container(
              height: 35,
              width: 45,
              margin: EdgeInsets.only(left: 15, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(FontAwesomeIcons.chevronLeft, size: 16, color: Colors.black),
            ),
        actions: [
               Container(
              height: 35,
              width: 45,
              margin: EdgeInsets.only(right: 15, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(FontAwesomeIcons.ellipsisVertical, size: 16, color: Colors.black),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0,left:15),
            child: Text(
            "Wednesday, 17 January 2024",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
          ),
          _buildDateSelector(),
          Expanded(child: _buildTaskListWithTimeSlots()),
        ],
      ),
    );
  }

  /// 📅 Date Selector Widget
  Widget _buildDateSelector() {
   final List<Map<String, String>> dates = [
    {"day": "14", "month": "Jan"},
    {"day": "15", "month": "Jan"},
    {"day": "16", "month": "Jan"},
    {"day": "17", "month": "Jan"},
    {"day": "18", "month": "Jan"},
    {"day": "19", "month": "Jan"},
    {"day": "20", "month": "Jan"},
    {"day": "21", "month": "Jan"},
    {"day": "22", "month": "Jan"},
    {"day": "23", "month": "Jan"},
    {"day": "24", "month": "Jan"},
    {"day": "25", "month": "Jan"},
    {"day": "26", "month": "Jan"},
    {"day": "27", "month": "Jan"},
    {"day": "28", "month": "Jan"},
    {"day": "29", "month": "Jan"},
    {"day": "30", "month": "Jan"},
    {"day": "31", "month": "Jan"},
  ];

    return  SizedBox(
              height: 70, // Height of the list
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                padding: EdgeInsets.only(left:5,top:8),
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                    },
                    child: AnimatedContainer(
                      height: isSelected ? 20 : 20,
                      width: isSelected ? 40 : 40,
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6.9),
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xfff26e56) : Color(0xfff6f6f6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date['month']!,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Quando",
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF868686),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            date['day']!,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Quando",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }

  /// Task List with Time Slots (Updated)
  Widget _buildTaskListWithTimeSlots() {
    return ListView.builder(
      itemCount: timeSlots.length,
      padding: EdgeInsets.only(top:30),
      itemBuilder: (context, index) {
        String time = timeSlots[index];

        List<Map<String, dynamic>> tasksForThisTime =
            tasks.where((t) => t["time"] == time).toList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Time Slot Text
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                      time,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF868686)),
                    ),
                
                    ],
                  ),
                ),
                SizedBox(width: 10),

                /// Task Card
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: tasksForThisTime.isNotEmpty
                        ? tasksForThisTime.map((task) {
                            return task.containsKey("isSubtask")
                                ? _buildSubtaskInput()
                                : task.containsKey("avatars")
                                    ? _buildTaskCardWithAvatars(task["title"],
                                        task["duration"],task['subtitle'], task["avatars"])
                                    : _buildTaskCard(
                                        task["title"], task["duration"]);
                          }).toList()
                        : [SizedBox(height:0)], // Maintain spacing
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 🏷️ Task Card with Ellipsis
  Widget _buildTaskCard(String title, String time) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Task Title & Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),

          /// ⋮ Ellipsis Icon
          Icon(FontAwesomeIcons.ellipsis, size: 18, color: Colors.black),
        ],
      ),
    );
  }

  /// 👥 Task Card with Avatars
  Widget _buildTaskCardWithAvatars(
      String title, String time, String subtitle, List<String> avatars) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Task Title & Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
                IntrinsicWidth(
                  child: Container(
                    width:2250,
                    height: 30,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top:5,right:10),
                    padding: EdgeInsets.only(left:2,right:2),
                    decoration: BoxDecoration(
                      color: Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(5)
                    ),
                               child: Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 11,fontWeight:FontWeight.w500)),
                
                  ),
                ),
                SizedBox(height: 8),

                Row(
                  children: avatars
                      .map((avatar) => Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(avatar),
                              radius: 12,
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),

          /// ⋮ Ellipsis Icon
          Icon(FontAwesomeIcons.ellipsis, size: 18, color: Colors.black),
        ],
      ),
    );
  }

  /// Add New Subtask Input (No ellipsis)
  Widget _buildSubtaskInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add new subtask",
              style: TextStyle(color: Colors.grey, fontSize: 14)),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 12,
            child: Icon(Icons.add, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }
}
