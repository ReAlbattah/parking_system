// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:parking_system/utils/textUtils.dart';
// import 'package:parking_system/view/widget/facilitiesCard.dart';
// import 'package:sizer/sizer.dart';

// class FacilitiesScreen extends StatelessWidget {
//   const FacilitiesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         title: TextUtils(
//             text: 'Facilities',
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontsize: 14.sp),
//         backgroundColor: Colors.blue.shade900,
//         elevation: 2,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               FacilitiesCard(
//                 image: Image.network(
//                   'https://github.com/myhopesx/parkingSystem-Frontend/blob/main/public/images/facility1.png?raw=true',
//                   height: 100,
//                   width: 350,
//                 ),
//                 locations: 'locationsss',
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               FacilitiesCard(
//                 image: Image.network(
//                   'https://github.com/myhopesx/parkingSystem-Frontend/blob/main/public/images/facility2.png?raw=true',
//                   height: 100,
//                   width: 350,
//                 ),
//                 locations: 'locations',
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               FacilitiesCard(
//                 image: Image.network(
//                   'https://github.com/myhopesx/parkingSystem-Frontend/blob/main/public/images/facility1.png?raw=true',
//                   height: 100,
//                   width: 350,
//                 ),
//                 locations: 'locations',
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               FacilitiesCard(
//                 image: Image.network(
//                   'https://github.com/myhopesx/parkingSystem-Frontend/blob/main/public/images/facility1.png?raw=true',
//                   height: 100,
//                   width: 350,
//                 ),
//                 locations: 'locations',
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               FacilitiesCard(
//                 image: Image.network(
//                   'https://github.com/myhopesx/parkingSystem-Frontend/blob/main/public/images/facility1.png?raw=true',
//                   height: 100,
//                   width: 350,
//                 ),
//                 locations: 'locations',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
