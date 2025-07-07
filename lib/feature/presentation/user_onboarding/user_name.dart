import 'package:flutter/material.dart';
import 'package:moviee/core/colors.dart';
import 'package:moviee/feature/presentation/dashboard/movie_dashboard.dart';

class UserNameScreen extends StatelessWidget {
  const UserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackGroundColor,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.close, color: Colors.white54),
                fillColor: Colors.red,
                focusColor: Colors.green,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                ),
              ),
            ),
            const Spacer(),
            _continueBtn(context),
          ],
        ),
      ),
    );
  }


  Widget _continueBtn(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoviesDashboard(),
              ));
        },
        child: const Text('Enter Movie Zone'));
  }

}
