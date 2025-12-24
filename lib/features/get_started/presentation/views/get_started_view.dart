// import 'package:flutter/material.dart';
// import 'package:style_hub/core/utils/app_colors.dart';
// import 'package:style_hub/core/utils/assets.dart';
// import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';

// class GetStartedView extends StatelessWidget {
//   const GetStartedView({super.key});
//   static const routeName = '/get-started';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(Assets.imagesOnBoardingTwo),
//                       fit: BoxFit.fill,
//                     ),
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.whiteColor,
//                         AppColors.lightGreyColor,
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomTextBotton(text: 'Sign In', onPressed: () {}),
//                     CustomTextBotton(
//                       text: 'Continue as Guest',
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
