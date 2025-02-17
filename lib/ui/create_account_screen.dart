import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 45,
                margin: EdgeInsets.only(top: 10, bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xffececec),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(FontAwesomeIcons.chevronLeft,
                    size: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Create Account 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Please register on our Streamline, where you can continue using our service.",
              style: TextStyle(fontSize: 12, color: Color(0xff777777)),
            ),
            SizedBox(height: 20),
            _buildTextField("Bruce Wayne"),
            SizedBox(height: 16),
            _buildTextField("brucewayne27@suarsa.com"),
            SizedBox(height: 16),
            _buildTextField("••••••••", isPassword: true),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: Colors.white, // ✅ Tick mark ka color

                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Color(0xfff26e56); // ✅ Checked background color
                      }
                      return Colors.white; // ✅ Unchecked background white
                    },
                  ),

                  side: MaterialStateBorderSide.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return BorderSide(
                          color: Color(0xfff26e56),
                          width: 1.5); // ✅ Checked border color
                    }
                    return BorderSide(
                        color: Colors.black,
                        width: 1.5); // ✅ Unchecked border black
                  }),

                  value: _agreeToTerms,
                  onChanged: (value) => setState(() => _agreeToTerms = value!),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "I agree to privacy policy & terms",
                      style: TextStyle(
                        color: Color(0xff777777),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _agreeToTerms ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff26e56),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Color(0xff777777),
                )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        color: Color(0xff777777),
                      ),
                    )),
                Expanded(
                    child: Divider(
                  color: Color(0xff777777),
                )),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton("assets/images/google.png"),
                SizedBox(width: 16),
                _buildSocialButton("assets/images/apple.png"),
                SizedBox(width: 16),
                _buildSocialButton("assets/images/facebook.png"),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign in instead",
                        style: TextStyle(
                            color: Color(0xfff26e56),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2),
      clipBehavior: Clip.hardEdge,
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
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          focusColor: Colors.white,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Color(0xff777777), fontSize: 14),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String asset) {
    return Container(
      width: 95,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(asset, width: 30, height: 30),
    );
  }
}
