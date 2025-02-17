import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; 

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _alertToggle = false;
  List<String> categories = [
    "Design",
    "Development",
    "Coding",
    "Meeting",
    "Office Time",
    "User Experience"
  ];
  // String? selectedDate;
  String selectedDate = "Select Date"; // Default text

  /// Function to show DatePicker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xfff26e56), // Calendar Header Background Color
            colorScheme: ColorScheme.light(primary: Color(0xfff26e56)), // Active Date Color
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateFormat("dd MMM yyyy").format(picked); // Format Date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopIcons(),
              SizedBox(height: 14),
              Text("New Tasks",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 14),
              _buildTextField("Task Title"),
              SizedBox(height: 13),
              _buildDateField(),
              SizedBox(height: 13),
              _buildSearchField("Assignee"),
              SizedBox(height: 13),
              _buildMultilineTextField("Add your task details"),
              SizedBox(height: 15),
              _buildIconsRow(),
              SizedBox(height: 15),
              Text("Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 5),
              _buildCategoryChips(),
              SizedBox(height: 5),
              _buildAlertToggle(),
              SizedBox(height: 20),
              _buildCreateTaskButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircleIcon(Icons.close, () {
          Navigator.pop(context);
        }),
        _buildCircleIcon(Icons.search, () {}),
      ],
    );
  }

  Widget _buildTextField(String hint) {
    return _buildStyledTextField(hint);
  }

  Widget _buildSearchField(String hint) {
    return _buildStyledTextField(hint, icon: Icons.search);
  }

  Widget _buildMultilineTextField(String hint) {
    return _buildStyledTextField(hint, maxLines: 4);
  }

  Widget _buildStyledTextField(String hint,
      {IconData? icon, int maxLines = 1}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 0.8),
            blurRadius: 0,
            spreadRadius: 0.4,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: Color(0xff777777), fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(icon, color: Colors.black54),
                )
              : null,
        ),
      ),
    );
  }

   Widget _buildDateField() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1.0),
          boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 0.8),
            blurRadius: 0,
            spreadRadius: 0.4,
            blurStyle: BlurStyle.outer,
          ),
        ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate,
              style: TextStyle(color: Color(0xff777777), fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: Icon(FontAwesomeIcons.caretDown, color: Colors.black,size:14,),
            ), // Calendar Icon
          ],
        ),
      ),
    );
  }

  Widget _buildIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildCircleIcon(Icons.grid_view, () {}),
        SizedBox(width: 10),
        _buildCircleIcon(Icons.text_format, () {}),
        SizedBox(width: 10),
        _buildCircleIcon(Icons.attach_file, () {},rotate:true),
      ],
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8,
      children: categories.map((category) {
        return Chip(
          label: Text(
            category,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xffececec),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      }).toList(),
    );
  }

  Widget _buildAlertToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Get alert for this task",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Switch(
          value: _alertToggle,
          onChanged: (value) => setState(() => _alertToggle = value),
          activeColor: Color(0xfff26e56),
          trackColor:MaterialStateProperty.all(Color(0xffececec),
          )
        ),
      ],
    );
  }

  Widget _buildCreateTaskButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xfff26e56),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text("Create Task",
          style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black, width: 1.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(0, 0.8),
          blurRadius: 0,
          spreadRadius: 0.4,
          blurStyle: BlurStyle.outer,
        ),
      ],
    );
  }

  Widget _buildCircleIcon(IconData icon, VoidCallback? ontap,{bool rotate = false}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Color(0xffececec),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: rotate ?
          Transform.rotate(
            angle: 0.8,
            child: Icon(icon, size: 20, color: Colors.black)) :
          Icon(icon, size: 20, color: Colors.black),
          ),
      ),
    );
  }
}
