import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/core/bottom_nav.dart';
import 'package:project_flan/features/community/community_controller.dart';
import 'package:rive/rive.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen>
    with TickerProviderStateMixin {
  // infinite scroll
  List<String> _items = <String>[];
  bool _isLoading = false;

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    _isLoading = false;

    if (!mounted) {
      return;
    }

    setState(() {
      _items = List.generate(_items.length + 5, (i) => 'Item $i');
    });
  }

  // tab
  late TabController _tabController;

  List<String> categoryList = ['전체', '지역', '인기', 'NEW', '태그'];

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    CommunityController().getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                onTap: (index) {
                  // category 를 이용하여 list 조절.
                  print(categoryList[index]);
                },
                tabs: [
                  for (var category in categoryList)
                    Container(
                      height: 30.h,
                      alignment: Alignment.center,
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'fontR',
                          // color: AppColors.defaultTextColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  for (var category in categoryList)
                    Container(
                        color: AppColors.scaffoldBackgroundColor,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 15.h),
                            if (category == '지역')
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12.w, right: 12.w, bottom: 15.h),
                                  child: Row(
                                    children: List.generate(
                                      10,
                                      (index) => Container(
                                        width: 64.w,
                                        height: 32.h,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        decoration: BoxDecoration(
                                          color: index == 0
                                              ? AppColors.primaryColor
                                              : Colors.white,
                                          border: index == 0
                                              ? null
                                              : Border.all(
                                                  width: 0.7.w,
                                                  color: AppColors.primaryColor,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Tag',
                                            style: TextStyle(
                                              fontFamily: 'fontR',
                                              fontSize: 12.sp,
                                              color: index == 0
                                                  ? Colors.white
                                                  : AppColors.defaultTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (category == '태그')
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      cursorColor: AppColors.textFieldGrayColor,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'fontR',
                                      ),
                                      decoration: InputDecoration(
                                        prefixIcon: Container(
                                          margin: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
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
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        hintText: '원하시는 태그(#)를 검색해보세요.',
                                        hintStyle: TextStyle(
                                          color: AppColors.textFieldGrayColor,
                                          fontSize: 13.sp,
                                          fontFamily: 'fontR',
                                        ),
                                        contentPadding: EdgeInsets.all(15.w),
                                      ),
                                    ),
                                  ),
                                  // 즐겨찾기 태그
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '즐겨찾기 태그',
                                          style: TextStyle(
                                            fontFamily: 'fontR',
                                            fontSize: 14.sp,
                                            color: AppColors.defaultTextColor,
                                          ),
                                        ),
                                        SizedBox(height: 7.5.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.go('/community-detail/:1');
                                          },
                                          child: Container(
                                            width: 1.sw,
                                            height: 70.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 10.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                width: 1.w,
                                                color: AppColors.primaryColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '# 태그',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'fontR',
                                                              fontSize: 13.sp,
                                                              color: AppColors
                                                                  .defaultTextColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          Text(
                                                            '태그 설명',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'fontL',
                                                              fontSize: 12.sp,
                                                              color: const Color(
                                                                  0xff4f4f4f),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '게시글',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'fontR',
                                                              fontSize: 13.sp,
                                                              color: AppColors
                                                                  .defaultTextColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          Text(
                                                            '3',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'fontR',
                                                              fontSize: 13.sp,
                                                              color: AppColors
                                                                  .defaultTextColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/images/star_active.svg',
                                                  width: 17.5.w,
                                                  height: 17.5.w,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  // 인기 태그
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '인기 태그',
                                          style: TextStyle(
                                            fontFamily: 'fontR',
                                            fontSize: 14.sp,
                                            color: AppColors.defaultTextColor,
                                          ),
                                        ),
                                        SizedBox(height: 7.5.h),
                                        Container(
                                          width: 1.sw,
                                          height: 70.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 10.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.w,
                                              color: AppColors.primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '# 태그',
                                                          style: TextStyle(
                                                            fontFamily: 'fontR',
                                                            fontSize: 13.sp,
                                                            color: AppColors
                                                                .defaultTextColor,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        Text(
                                                          '태그 설명',
                                                          style: TextStyle(
                                                            fontFamily: 'fontL',
                                                            fontSize: 12.sp,
                                                            color: const Color(
                                                                0xff4f4f4f),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '게시글',
                                                          style: TextStyle(
                                                            fontFamily: 'fontR',
                                                            fontSize: 13.sp,
                                                            color: AppColors
                                                                .defaultTextColor,
                                                          ),
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          '3',
                                                          style: TextStyle(
                                                            fontFamily: 'fontR',
                                                            fontSize: 13.sp,
                                                            color: AppColors
                                                                .defaultTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/star.svg',
                                                width: 17.5.w,
                                                height: 17.5.w,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (category != '태그')
                              Expanded(
                                child: InfiniteList(
                                  itemCount: _items.length,
                                  isLoading: _isLoading,
                                  onFetchData: _fetchData,
                                  loadingBuilder: (context) => SizedBox(
                                    width: 150.w,
                                    height: 150.w,
                                    child: const RiveAnimation.asset(
                                      'assets/images/loader.riv',
                                    ),
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        context.push('/community-detail/:1');
                                      },
                                      child: Container(
                                        width: 1.sw,
                                        height: 150.h,
                                        margin: EdgeInsets.only(
                                          left: 16.w,
                                          right: 16.w,
                                          bottom: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '질문내용',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontFamily: 'fontL',
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            Text(
                                              'by 이름',
                                              style: TextStyle(
                                                color: const Color(0xffC5C0C0),
                                                fontSize: 12.sp,
                                                fontFamily: 'fontL',
                                              ),
                                            ),
                                            SizedBox(height: 15.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/community_icon/heart.svg',
                                                      width: 16.w,
                                                      height: 16.w,
                                                    ),
                                                    SizedBox(width: 7.5.w),
                                                    Text(
                                                      '1000',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffC5C0C0),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'fontL',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 15.w),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/community_icon/comment.svg',
                                                      width: 16.w,
                                                      height: 16.w,
                                                    ),
                                                    SizedBox(width: 7.5.w),
                                                    Text(
                                                      '10',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffC5C0C0),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'fontL',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 15.w),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/community_icon/ago.svg',
                                                      width: 16.w,
                                                      height: 16.w,
                                                    ),
                                                    SizedBox(width: 7.5.w),
                                                    Text(
                                                      '방금 전',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffC5C0C0),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'fontL',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        location: 'community',
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 45.w,
          height: 45.w,
          padding: EdgeInsets.all(12.5.w),
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9).withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/images/floating_pencil.svg',
          ),
        ),
      ),
    );
  }
}
