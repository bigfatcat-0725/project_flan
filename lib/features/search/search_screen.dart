import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/core/bottom_nav.dart';
import 'package:project_flan/features/search/search_controller.dart';
import 'package:project_flan/model/user_model.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController(text: '');
    final userList = useState([]);

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
                  '검색',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'fontB',
                    color: AppColors.defaultTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  bottom: 15.h,
                ),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Color(0xffdddddd),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchTextController,
                  onChanged: (value) async {
                    if (value != '') {
                      final data = await SearchController()
                          .getSearchUserList(nikname: value);
                      userList.value = [...data];
                    }
                  },
                  cursorColor: AppColors.textFieldGrayColor,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'fontR',
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: SvgPicture.asset(
                        'assets/images/search.svg',
                        width: 45.w,
                        height: 45.w,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: 45.w,
                      maxHeight: 45.w,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    hintText: '이름을 검색해보세요.',
                    hintStyle: TextStyle(
                      color: AppColors.textFieldGrayColor,
                      fontSize: 13.sp,
                      fontFamily: 'fontR',
                    ),
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: userList.value.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (context, index) {
                    final UserModel user = userList.value[index];

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 45.w,
                                height: 45.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                user.nickname.toString(),
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'fontR',
                                  color: AppColors.defaultTextColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 70.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                '팔로우',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'fontL',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(
          location: 'search',
        ),
      ),
    );
  }
}
