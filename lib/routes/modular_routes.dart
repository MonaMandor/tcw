// routes/modular_routes.dart
// ignore_for_file: prefer_const_constructors// ignore_for_file: prefer_const_constructors
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';
import 'package:tcw/core/constansts/asset_manger.dart';
import 'package:tcw/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:tcw/features/auth/presentation/pages/logIn_screen.dart';
import 'package:tcw/features/auth/presentation/pages/next_or_back_screen.dart';
import 'package:tcw/features/auth/presentation/pages/on_bording_screens.dart';
import 'package:tcw/features/auth/presentation/pages/splash_screen.dart';
import 'package:tcw/features/auth/presentation/pages/verification_screen.dart';
import 'package:tcw/features/courses/data/models/reel_model.dart';
import 'package:tcw/features/courses/presentation/pages/media_screen.dart';
import 'package:tcw/features/home/presentation/pages/home_layout_screen.dart';
import 'package:tcw/features/notification/presentation/pages/notification_screen.dart';
import 'package:tcw/features/points/presentation/pages/points_rewards_screen.dart';
import 'package:tcw/routes/routes_names.dart';

List<ModularRoute> modularRoutes = <ChildRoute<dynamic>>[
 ChildRoute<dynamic>(
    AppRoutes.start,
    child: (_, ModularArguments args) => const SplashScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.onboarding,
    child: (_, ModularArguments args) =>  OnboardingScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.newOrOldUserScreen,
    child: (_, ModularArguments args) =>  NextOrBackScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.loginPage,
    child: (_, ModularArguments args) => const LoginPage(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.forgotPasswordScreen,
    child: (_, ModularArguments args) => const ForgotPasswordScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.oTPVerificationScreen,
    child: (_, ModularArguments args) =>  OTPVerificationScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.homeLayout,
    child: (_, ModularArguments args) => const HomeLayout(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.tCWMediaScreen,
    child: (_, ModularArguments args) =>  TCWMediaScreen(
      reels: [
        Reel (
          thumbnail: AssetManger.reel, 
          views: 4,

        ),
        Reel (
          thumbnail: AssetManger.reel, 
          views: 4,

        ),
        Reel (
          thumbnail: AssetManger.reel, 
          views: 4,

        ),
        Reel (
          thumbnail: AssetManger.reel, 
          views: 4,

        ),
      ],

    ),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.notificationScreen,
    child: (_, ModularArguments args) =>  NotificationScreen(
     
    ),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.pointsRewardsScreen,
    child: (_, ModularArguments args) =>  PointsRewardsScreen(
      showPointsTabFirst: args.data ?? true,
    ),
    transition: TransitionType.upToDown,
  ),
];
