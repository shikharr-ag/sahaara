import 'dart:ui'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/auth/presentation/screen/appwrite_login_page.dart';
import 'package:sahaara/chat/presentation/screens/call_chat_screen.dart';
import 'package:sahaara/chat/presentation/screens/chat_screen.dart';
import 'package:sahaara/firebase_options.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/sizing.dart';
import 'package:sahaara/package_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:appwrite/appwrite.dart';
import 'home/presentation/screens/home_screen.dart';

final sizing = Sizing();


Client client = Client();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  client.setProject('67235e43000669db1bca');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Sizer(builder: (context, _, __) {
        return MaterialApp(
            title: 'Sahaara',
            debugShowCheckedModeBanner: false,
            theme: AppColors.theme,
            home: const PackageAnimate());
      }),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late AnimationController _delayController;
//   late AnimationController _circleExpandController;
//   late Animation<double> _circleHeightAnimation;
//   late Animation<double> _circleWidthAnimation;
//   late Animation<double> _textOpacityAnimation;
//   late Animation<double> _horizontalPositionAnimation;
//   late Animation<double> _verticalPositionAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _delayController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     _circleExpandController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     // Initialize with dummy values, will be updated in didChangeDependencies
//     _circleHeightAnimation =
//         Tween<double>(begin: 50, end: 50).animate(_circleExpandController);
//     _circleWidthAnimation =
//         Tween<double>(begin: 50, end: 50).animate(_circleExpandController);
//     _horizontalPositionAnimation =
//         Tween<double>(begin: 0, end: 0).animate(_circleExpandController);
//     _verticalPositionAnimation =
//         Tween<double>(begin: 0, end: 0).animate(_circleExpandController);

//     _textOpacityAnimation = Tween<double>(
//       begin: 1.0,
//       end: 0.0,
//     ).animate(CurvedAnimation(
//       parent: _circleExpandController,
//       curve: const Interval(0, 0.3, curve: Curves.easeOut),
//     ));
//   }

//   void _updateAnimations() {
//     final size = MediaQuery.of(context).size;
//     final maxSize = size.width * 2;

//     // First phase: Horizontal movement to center (0 to 0.5)
//     _horizontalPositionAnimation = Tween<double>(
//       begin: -size.width * 0.25,
//       end: 0,
//     ).animate(CurvedAnimation(
//       parent: _circleExpandController,
//       curve: const Interval(0, 0.5, curve: Curves.easeInOut),
//     ));

//     // Second phase: Vertical movement and size increase happen together (0.5 to 1.0)
//     _circleHeightAnimation = Tween<double>(
//       begin: 50,
//       end: maxSize,
//     ).animate(CurvedAnimation(
//       parent: _circleExpandController,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
//     ));

//     _circleWidthAnimation = Tween<double>(
//       begin: 50,
//       end: maxSize,
//     ).animate(CurvedAnimation(
//       parent: _circleExpandController,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
//     ));

//     _verticalPositionAnimation = Tween<double>(
//       begin: 0,
//       end: size.height * 0.5,
//     ).animate(CurvedAnimation(
//       parent: _circleExpandController,
//       curve: const Interval(0.5, 0.7, curve: Curves.easeInOut),
//     ));
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateAnimations();

//     // Only start the animation if it hasn't been started yet
//     if (!_delayController.isAnimating && !_circleExpandController.isAnimating) {
//       _delayController.forward().then((_) {
//         _circleExpandController.forward();
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _delayController.dispose();
//     _circleExpandController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: SahaaraColorScheme.whiteColor,
//       body: AnimatedBuilder(
//         animation:
//             Listenable.merge([_circleExpandController, _delayController]),
//         builder: (context, child) {
//           return Center(
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 Transform.translate(
//                   offset: Offset(
//                     _horizontalPositionAnimation.value,
//                     _verticalPositionAnimation.value,
//                   ),
//                   child: Container(
//                     height: _circleHeightAnimation.value,
//                     width: _circleWidthAnimation.value,
//                     decoration: const BoxDecoration(
//                       color: SahaaraColorScheme.yellowColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: const Offset(10, 0),
//                   child: Opacity(
//                     opacity: _textOpacityAnimation.value,
//                     child: Text(
//                       'Sahaara',
//                       style: GoogleFonts.fraunces(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
