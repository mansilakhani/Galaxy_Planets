import 'package:flutter/material.dart';

import 'home_page_body.dart';

class HomePage extends StatelessWidget {
  final double barHeight = 66.0;
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          )
        ],
        title: const Text(
          "GALAXY PLANETS",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: statusBarHeight),
          height: statusBarHeight + barHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          //GradientAppBar("GALAXY PLANETS"),
          HomePageBody(),
        ],
      ),
    );
  }
}

// class GradientAppBar extends StatelessWidget {
//   final String title;
//   final double barHeight = 66.0;
//
//   GradientAppBar(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//
//     return Container(
//       padding: EdgeInsets.only(top: statusBarHeight),
//       height: statusBarHeight + barHeight,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
//             begin: FractionalOffset(0.0, 0.0),
//             end: FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp),
//       ),
//       child: Center(
//         child: Text(
//           title,
//           style: const TextStyle(
//               color: Colors.white,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }
