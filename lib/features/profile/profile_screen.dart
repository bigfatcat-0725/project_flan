import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/core/bottom_nav.dart';
import 'package:project_flan/features/auth/auth_controller.dart';
import 'package:project_flan/features/profile/widgets/complete_card.dart';
import 'package:project_flan/features/profile/widgets/new_card.dart';
import 'package:project_flan/features/profile/widgets/reject_card.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userProvider.notifier).state!;

    return WillPopScope(
      onWillPop: () async {
        // 메인화면들 뒤로가기 막기
        return false;
      },
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          width: 1.sw,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: FittedBox(
                      child: SvgPicture.asset('assets/images/back.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [Container()],
          backgroundColor: AppColors.scaffoldBackgroundColor,
          elevation: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          toolbarHeight: 40.h,
          titleSpacing: 0,
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${userInfo.nickname}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'fontB',
                    color: AppColors.defaultTextColor,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/card/share.svg',
                      width: 17.5.w,
                      height: 17.5.w,
                    ),
                    SizedBox(width: 10.w),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: SvgPicture.asset(
                          'assets/images/menu.svg',
                          width: 17.5.w,
                          height: 17.5.w,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset.zero,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(
                          left: 16.w, right: 16.w, bottom: 5.h, top: 5.h),
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70.w,
                                height: 70.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 25.w),
                              Expanded(
                                child: SizedBox(
                                  height: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '${3}',
                                                style: TextStyle(
                                                  fontFamily: 'fontB',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                '팔로워',
                                                style: TextStyle(
                                                  fontFamily: 'fontR',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${3}',
                                                style: TextStyle(
                                                  fontFamily: 'fontB',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                '팔로잉',
                                                style: TextStyle(
                                                  fontFamily: 'fontR',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${3}',
                                                style: TextStyle(
                                                  fontFamily: 'fontB',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                '답변완료',
                                                style: TextStyle(
                                                  fontFamily: 'fontR',
                                                  color:
                                                      const Color(0xff1D1D1B),
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '이곳은 무언가를 작성하는 공간입니다.',
                            style: TextStyle(
                              fontFamily: 'fontL',
                              fontSize: 12.sp,
                              color: const Color(0xff9e9e9e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: SizedBox(
                  width: 1.sw,
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset.zero,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 1.sw,
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.w,
                                color: const Color(0xffD9D9D9),
                              ),
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: AppColors.primaryColor,
                            labelColor: AppColors.primaryColor,
                            unselectedLabelColor: AppColors.defaultTextColor,
                            labelStyle: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'fontB',
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'fontR',
                            ),
                            onTap: (index) {},
                            tabs: [
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '새질문',
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '답변완료',
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '답변거절',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: const [
                              NewCard(),
                              CompleteCard(),
                              RejectCard(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(
          location: 'profile',
        ),
      ),
    );
  }
}
