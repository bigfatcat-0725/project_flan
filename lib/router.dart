import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/features/auth/login_screen.dart';
import 'package:project_flan/features/auth/sign_screen.dart';
import 'package:project_flan/features/community/community_detail_screen.dart';
import 'package:project_flan/features/community/community_screen.dart';
import 'package:project_flan/features/home/home_screen.dart';
import 'package:project_flan/features/home/widgets/card_detail.dart';
import 'package:project_flan/features/home/widgets/pop_edit.dart';
import 'package:project_flan/features/profile/profile_screen.dart';
import 'package:project_flan/features/search/search_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: '/sign',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SignScreen());
      },
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          key: UniqueKey(),
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/community',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: CommunityScreen());
      },
    ),
    GoRoute(
      path: '/community-detail/:id',
      pageBuilder: (context, state) {
        return NoTransitionPage(
            child: CommunityDetailScreen(
          id: state.params['id'].toString(),
        ));
      },
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SearchScreen());
      },
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ProfileScreen());
      },
    ),
  ],

  // redirect: (context, state) async {
  //   bool isAuth = false;
  //   if (isAuth) {
  //     return '/';
  //   } else {
  //     return '/login';
  //   }
  // },
);
