import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        leadingWidth: 60,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 35,
            width: 45,
            margin: EdgeInsets.only(top: 10, left: 15, bottom: 5),
            decoration: BoxDecoration(
              color: Color(0xffececec),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(FontAwesomeIcons.chevronLeft,
                size: 16, color: Colors.black),
          ),
        ),
      
       
      ),
      body: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisAlignment: MainAxisAlignment.center,
            
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
              children: [
                Text("12", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                Text("In Process tasks", style: TextStyle(fontSize: 10,fontFamily: 'Poppins')),
              ],
            ),

                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/boy_3d_image.jpg'),
                ),
                 Column(
              children: [
                Text("42", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                Text("Completed tasks", style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
              ],
            ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Bruce Wayne",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Product Designer", style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.ROUTE_CREATE_ACCOUNT);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff26e56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal:35, vertical: 8),
              ),
              child: Text("Edit Profile", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  settingTile("assets/images/bell_icon.png", "Notification",(){
                    Navigator.pushNamed(context, AppRoutes.ROUTE_NOTIFICATION);
                  }),
                  settingTile("assets/images/secure.png", "Security",(){}),
                  settingTile("assets/images/internet.png", "Language & Region",(){}),
                  settingTile("assets/images/shopping.png", "Go Premium",(){}),
                  settingTile("assets/images/question_icon.png", "Help Center",(){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingTile(String icon, String title,VoidCallback? ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffececec).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
            child: Image.asset(icon, height: 20, width:20,fit:BoxFit.contain,color:Colors.black,)),
          title: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ),
      ),
    );
  }
}
