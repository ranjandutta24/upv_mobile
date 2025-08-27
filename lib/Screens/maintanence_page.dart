import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaintancePage extends StatelessWidget {
  const MaintancePage({super.key, required this.m_text});
  final String m_text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Maintance Icon
            const Icon(
              Icons.manage_history_outlined,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 20),

            // Maintance Title
            const Text(
              "Maintenance Break",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Update Message
            Text(
              m_text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Update Button
            // ElevatedButton.icon(
            //   onPressed: () async {
            //     // String url = appLink; // Replace with your app download link
            //     // if (await canLaunch(url)) {
            //     //   await launch(url);
            //     // } else {}
            //   },
            //   icon: const Icon(Icons.download, color: Colors.white),
            //   label: const Text(
            //     "Download Update",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     foregroundColor: Colors.white,
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),

            // Exit Button
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Closes the app on Android
              },
              child: const Text(
                "Exit App",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
