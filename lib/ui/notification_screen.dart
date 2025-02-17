import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(home: NotificationScreen()));
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      "date": "Today",
      "data": [
        {
          "title": "Automation",
          "time": "1 hr ago",
          "message": "An email was sent to everyone on this board",
          "image": "assets/images/gmail.png",
          "type": "gmail",
        },
        {
          "title": "Automation",
          "time": "1 hr ago",
          "message": "Event date has arrived! An email was sent to @LaraCroft",
          "image": "assets/images/boy_3d_image.jpg",
          "type": "image",
        },
        {
          "title": "Automation",
          "time": "1 hr ago",
          "message": "A new document was signed and added to your board",
          "image": "assets/images/boy_latest.png",
          "type": "image",
        },
        {
          "title": "Automation",
          "time": "1 hr ago",
          "message":
              "Event date has arrived! Clark Kent assigned WBC-40 to you",
          "image": "assets/images/boy_image_todo.jpg",
          "type": "image",
        },
      ]
    },
    {
      "date": "Yesterday",
      "data": [
        {
          "title": "Automation",
          "time": "1 hr ago",
          "message": "An email was sent to everyone on this board",
          "image": "assets/images/gmail.png",
          "type": "gmail",
        },
      ]
    }
  ];

  void removeNotification(int sectionIndex, int itemIndex) {
    setState(() {
      notifications[sectionIndex]["data"].removeAt(itemIndex);
      if (notifications[sectionIndex]["data"].isEmpty) {
        notifications.removeAt(sectionIndex);
      }
    });
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> filters = ["All", "Unread", "i was mentioned"];
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
        title: Text(
          "Notification",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                filters.length,
                (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedIndex = index; // Update selected button
                          },
                        );
                      },
                      child:
                          FilterButton(filters[index], selectedIndex == index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, sectionIndex) {
                  var section = notifications[sectionIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(section["date"],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ...List.generate(section["data"].length, (itemIndex) {
                        var notification = section["data"][itemIndex];

                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) =>
                              removeNotification(sectionIndex, itemIndex),
                          background: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16),
                            child: const Icon(Icons.delete,
                                color: Colors.white, size: 24),
                          ),
                          child: NotificationCard(
                            title: notification["title"],
                            time: notification["time"],
                            message: notification["message"],
                            icon: notification["icon"],
                            image: notification["image"],
                            type: notification['type'],
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget FilterButton(String label, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    margin: EdgeInsets.only(left: 9),
    decoration: BoxDecoration(
      color: isSelected ? Color(0xfff26e56) : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
    child: Text(
      label,
      style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black),
    ),
  );
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final String message;
  final IconData? icon;
  final String? image;
  final String type;

  const NotificationCard({
    super.key,
    required this.title,
    required this.time,
    required this.message,
    this.icon,
    this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage:
                type == "gmail" ? null : AssetImage(image.toString()),
            child: type == "gmail"
                ? Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/gmail.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("•",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff919191))),
                    SizedBox(
                      width: 5,
                    ),
                    Text(time,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff919191))),
                  ],
                ),
                const SizedBox(height: 4),
                Text(message,
                    style: TextStyle(fontSize: 11, color: Color(0xff919191))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
