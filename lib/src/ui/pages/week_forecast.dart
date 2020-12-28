// import 'package:flutter/material.dart';
// import 'package:weatherlike/src/ui/constants.dart';
// import 'package:weatherlike/src/ui/widgets/weather_line.dart';

// class WeekForecastPage extends StatelessWidget {
//   static const routeName = '/week';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         elevation: 0.0,
//         toolbarHeight: 75.0,
//         leading: IconButton(
//           iconSize: 30.0,
//           icon: Icon(Icons.keyboard_arrow_left),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.baseline,
//           children: [
//             Text(
//               'Saint Petersburg,',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               ' Russia',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white54,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.only(
//             left: kPagePadding,
//             right: kPagePadding,
//             bottom: kPagePadding,
//           ),
//           children: [
//             Text(
//               'Next 7 days',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//                 fontSize: 24.0,
//               ),
//             ),
//             for (int i = 0; i < 8; i++)
//               Padding(
//                 padding: EdgeInsets.only(top: 40.0),
//                 child: WeatherLine(
//                   date: '3 Oct',
//                   weekDay: 'Monday',
//                   icon: 'assets/icons/iconfinder_weather_2_2682849.png',
//                   dayTemp: 25,
//                   nightTemp: 20,
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
