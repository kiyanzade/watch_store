import 'package:flutter/material.dart';
import 'package:watch_store_app/screens/send_otp_screen.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButtomWidget(
        title: 'aaa',
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SendOtpScreen(),
        )),
      ),
    );
  }
}
