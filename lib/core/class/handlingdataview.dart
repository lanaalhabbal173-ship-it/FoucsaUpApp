// import 'package:flutter/widgets.dart';
// import 'package:lottie/lottie.dart';
// import 'package:ecommerceapp/core/class/constant/imageassets.dart';
// import 'package:ecommerceapp/core/class/statusrequest.dart';

// class HandlingdataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingdataRequest({
//     super.key,
//     required this.statusRequest,
//     required this.widget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(Imageassets.loading, width: 250, height: 250),
//           )
//         : statusRequest == StatusRequest.offlinefailure
//         ? Center(
//             child: Lottie.asset(Imageassets.offline, width: 250, height: 250),
//           )
//         : statusRequest == StatusRequest.serverfailure
//         ? Center(
//             child: Lottie.asset(Imageassets.server, width: 250, height: 250),
//           )
//         : widget;
//   }
// }
