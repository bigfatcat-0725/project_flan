import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_flan/core/app_colors.dart';
import 'package:project_flan/features/home/widgets/pop_delete.dart';
import 'package:project_flan/features/home/widgets/pop_report.dart';

class CommunityDetailScreen extends ConsumerWidget {
  const CommunityDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              width: 1.sw,
              height: 1.sh + 100.h * 5,
              constraints: BoxConstraints(
                minHeight: 1.sh,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 0.65.sh,
                        color: Colors.black,
                      ),
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '질문 내용',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontFamily: 'fontR',
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'by 익명',
                              style: TextStyle(
                                color: const Color(0xff9E9E9E),
                                fontSize: 14.sp,
                                fontFamily: 'fontR',
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              child: Wrap(
                                spacing: 15.w,
                                runSpacing: 15.w,
                                children: List.generate(
                                    15,
                                    (index) => Text(
                                          '# 태그',
                                          style: TextStyle(
                                            color: const Color(0xff959595),
                                            fontFamily: 'fontL',
                                            fontSize: 12.sp,
                                          ),
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10.w,
                        bottom: 10.h,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/community_icon/heart.svg',
                                  color: const Color(0xffD9D9D9),
                                  width: 17.5.w,
                                  height: 17.5.w,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '123',
                                  style: TextStyle(
                                    color: const Color(0xffD9D9D9),
                                    fontFamily: 'fontL',
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/community_icon/comment.svg',
                                  color: const Color(0xffD9D9D9),
                                  width: 17.5.w,
                                  height: 17.5.w,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '123',
                                  style: TextStyle(
                                    color: const Color(0xffD9D9D9),
                                    fontFamily: 'fontL',
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/community_icon/ago.svg',
                                  color: const Color(0xffD9D9D9),
                                  width: 17.5.w,
                                  height: 17.5.w,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '123',
                                  style: TextStyle(
                                    color: const Color(0xffD9D9D9),
                                    fontFamily: 'fontL',
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 1.sw,
                            height: 80.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '익명',
                                              style: TextStyle(
                                                fontFamily: 'fontB',
                                                fontSize: 13.sp,
                                                color:
                                                    AppColors.defaultTextColor,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              '1시간 전',
                                              style: TextStyle(
                                                fontFamily: 'fontL',
                                                fontSize: 12.sp,
                                                color:
                                                    AppColors.defaultTextColor,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        elevation: 0,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        barrierDismissible:
                                                                            true,
                                                                        builder:
                                                                            (context) {
                                                                          return const PopReport();
                                                                        });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 1.sw,
                                                                    height:
                                                                        45.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        '신고',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'fontL',
                                                                          fontSize:
                                                                              13.sp,
                                                                          color:
                                                                              AppColors.redColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        5.h),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        barrierDismissible:
                                                                            true,
                                                                        builder:
                                                                            (context) {
                                                                          return const PopReportUser();
                                                                        });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 1.sw,
                                                                    height:
                                                                        45.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        '차단하기',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'fontL',
                                                                          fontSize:
                                                                              13.sp,
                                                                          color:
                                                                              AppColors.redColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        5.h),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    context
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 1.sw,
                                                                    height:
                                                                        45.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        '취소',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'fontL',
                                                                          fontSize:
                                                                              13.sp,
                                                                          color:
                                                                              AppColors.defaultTextColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: 20.w,
                                                          vertical: 30.h,
                                                        ),
                                                        insetPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    0.w),
                                                      );
                                                    });
                                              },
                                              child: SvgPicture.asset(
                                                'assets/images/more.svg',
                                                width: 3.w,
                                                height: 3.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        SizedBox(
                                          width: 1.sw,
                                          child: Text(
                                            '댓글내용',
                                            style: TextStyle(
                                              fontFamily: 'fontR',
                                              fontSize: 12.sp,
                                              color: AppColors.defaultTextColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 7.5.h),
                                        Row(
                                          children: [
                                            Text(
                                              '답변달기',
                                              style: TextStyle(
                                                fontFamily: 'fontR',
                                                fontSize: 13.sp,
                                                color: const Color(0xff4F4F4F)
                                                    .withOpacity(0.72),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              '답글 숨기기',
                                              style: TextStyle(
                                                fontFamily: 'fontR',
                                                fontSize: 13.sp,
                                                color: const Color(0xff4F4F4F)
                                                    .withOpacity(0.72),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  index == 1
                                      ? 'assets/images/bookmark_active.svg'
                                      : 'assets/images/bookmark.svg',
                                  width: 17.5.w,
                                  height: 17.5.w,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: SizedBox(
              width: 1.sw,
              height: 30.h,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SizedBox(
                        width: 17.5.w,
                        height: 17.5.w,
                        child: FittedBox(
                          child: SvgPicture.asset(
                            'assets/images/back.svg',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                alignment: Alignment.bottomCenter,
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 1.sw,
                                            height: 45.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '답변 삭제',
                                                style: TextStyle(
                                                  fontFamily: 'fontL',
                                                  fontSize: 13.sp,
                                                  color: AppColors.redColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Container(
                                            width: 1.sw,
                                            height: 45.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '취소',
                                                style: TextStyle(
                                                  fontFamily: 'fontL',
                                                  fontSize: 13.sp,
                                                  color: AppColors
                                                      .defaultTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 30.h,
                                ),
                                insetPadding:
                                    EdgeInsets.symmetric(horizontal: 0.w),
                              );
                            });
                      },
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  alignment: Alignment.bottomCenter,
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return const PopReport();
                                                  });
                                            },
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '신고',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors.redColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return const PopReportUser();
                                                  });
                                            },
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '차단하기',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors.redColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return const PopDelete();
                                                  });
                                            },
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '삭제하기',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors.redColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          GestureDetector(
                                            onTap: () {
                                              context.pop();
                                            },
                                            child: Container(
                                              width: 1.sw,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '취소',
                                                  style: TextStyle(
                                                    fontFamily: 'fontL',
                                                    fontSize: 13.sp,
                                                    color: AppColors
                                                        .defaultTextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 30.h,
                                  ),
                                  insetPadding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                );
                              });
                        },
                        child: SizedBox(
                          width: 15.w,
                          height: 15.w,
                          child: FittedBox(
                            child: SvgPicture.asset(
                              'assets/images/more.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 1.sw,
            height: MediaQuery.of(context).padding.top,
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 50.h + MediaQuery.of(context).padding.bottom,
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
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 클릭하면 익명 <-> 공개 전환
                    },
                    child: Container(
                      width: 75.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          '익명',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontFamily: 'fontR',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.textFieldGrayColor,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'fontR',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: '댓글을 남겨주세요.',
                        hintStyle: TextStyle(
                          color: AppColors.textFieldGrayColor,
                          fontSize: 13.sp,
                          fontFamily: 'fontR',
                        ),
                        contentPadding: EdgeInsets.all(15.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopReportUser extends ConsumerWidget {
  const PopReportUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                width: 1.sw,
                height: 130.h,
                margin: EdgeInsets.symmetric(horizontal: 0.w),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '차단하기',
                      style: TextStyle(
                        fontFamily: 'fontB',
                        fontSize: 17.sp,
                        color: AppColors.defaultTextColor,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '차단한 친구가 보내는 메세지를 받을 수 없으며,',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 12.sp,
                            color: AppColors.defaultTextColor,
                            letterSpacing: -0.05.sp,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Text(
                          '목록에서 삭제됩니다.',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 12.sp,
                            color: AppColors.defaultTextColor,
                            letterSpacing: -0.05.sp,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Text(
                          '(차단 여부는 상대방이 알 수 없습니다)',
                          style: TextStyle(
                            fontFamily: 'fontL',
                            fontSize: 12.sp,
                            color: AppColors.redColor,
                            letterSpacing: -0.05.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.5.h),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return const PopReportUser();
                    },
                  );
                },
                child: Container(
                  width: 1.sw,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '차단하기',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 13.sp,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: 1.sw,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '취소',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 13.sp,
                        color: AppColors.defaultTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
    );
  }
}
