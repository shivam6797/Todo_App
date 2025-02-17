import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/ui/create_account_screen.dart';
import 'package:todo_app/ui/home_screen.dart';
import 'package:todo_app/ui/new_task_screen.dart';
import 'package:todo_app/ui/ongoing_process.dart';
import 'package:todo_app/ui/profile_screen.dart';
import 'package:todo_app/ui/task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TaskScreen(),
    OngoingProcessScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false; 
        }
        return true; 
      },
      child: Scaffold(
        body:_screens[_selectedIndex],
        
         bottomNavigationBar: BottomAppBar(
          color: Color(0xfff6f6f6),
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.houseChimney,
                    color: _selectedIndex == 0 ? Color(0xfff26e56) : Colors.grey, size: 18),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.solidCalendarDays,
                    color: _selectedIndex == 1 ? Color(0xfff26e56) : Colors.grey, size: 18),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 40), // Space for floating button
              IconButton(
                icon: Icon(FontAwesomeIcons.fileCircleCheck,
                    color: _selectedIndex == 2 ? Color(0xfff26e56) : Colors.grey, size: 18),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.user,
                    color: _selectedIndex == 3 ? Color(0xfff26e56) : Colors.grey, size: 18),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
    
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfff26e56),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewTaskScreen()), // Open screen without bottom navigation
            );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}