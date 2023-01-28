import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({
    Key? key,
    required this.location,
  }) : super(key: key);
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 최상단 이동
    final scrollController = PrimaryScrollController.of(context);

    // bottom bar icon
    List<String> bottomIcon = [
      (location == 'home'
          ? 'assets/images/bottom_icon/home_active.svg'
          : 'assets/images/bottom_icon/home.svg'),
      (location == 'community'
          ? 'assets/images/bottom_icon/community_active.svg'
          : 'assets/images/bottom_icon/community.svg'),
      (location == 'search'
          ? 'assets/images/bottom_icon/search_active.svg'
          : 'assets/images/bottom_icon/search.svg'),
      (location == 'heart'
          ? 'assets/images/bottom_icon/heart_active.svg'
          : 'assets/images/bottom_icon/heart.svg'),
      (location == 'profile'
          ? 'assets/images/bottom_icon/profile_active.svg'
          : 'assets/images/bottom_icon/profile.svg'),
    ];

    return Stack(
      children: [
        Container(
          height: 40.h + MediaQuery.of(context).padding.bottom,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset.zero,
                blurRadius: 2,
              ),
            ],
          ),
        ),
        SafeArea(
          child: Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              children: List.generate(
                5,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          context.go('/home');
                          return;
                        case 1:
                          context.go('/community');
                          return;
                        case 2:
                          context.go('/search');
                          return;
                        case 3:
                          context.go('/home');
                          return;
                        case 4:
                          context.go('/profile');
                          return;
                        default:
                          print('not move');
                      }
                      scrollController.jumpTo(0);
                    },
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(
                        bottomIcon[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
