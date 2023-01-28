import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_flan/core/app_colors.dart';

class PopReport extends ConsumerWidget {
  const PopReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> reportList = [
      '폭력 및 범죄 활동 유도',
      '홍보, 상업적 광고 및 게시물 도배',
      '음란 및 청소년에게 부적절한 내용',
      '자살 또는 자해 언급',
      '괴롭힘 또는 온라인 왕따',
      '만남 / 전화 / 구인 / 타 SNS로 유도',
    ];

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
                  '신고',
                  style: TextStyle(
                    fontFamily: 'fontB',
                    fontSize: 17.sp,
                    color: AppColors.defaultTextColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '지식재산권 침해를 신고하는 경우를 제외하고',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '회원님의 신고는 익명으로 신고됩니다.',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '단, 반복되는 허위신고 또한',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.redColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '이용정지 대상이 될 수 있습니다.',
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
          for (var reportText in reportList)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                    print(reportText);
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return const PopReport2();
                        });
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
                        reportText,
                        style: TextStyle(
                          fontFamily: 'fontL',
                          fontSize: 13.sp,
                          color: AppColors.defaultTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
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

class PopReport2 extends ConsumerWidget {
  const PopReport2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: SizedBox(
        width: 290.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '신고 완료',
              style: TextStyle(
                fontFamily: 'fontB',
                fontSize: 17.sp,
                color: AppColors.defaultTextColor,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '신고 내용은 관리자에게 제출되었습니다.',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '서비스 내 부적절한 신고를 해주셔서 감사합니다.',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '신고 내용을 검토하여 서비스 개선에',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      '참고하도록 노력하겠습니다.',
                      style: TextStyle(
                        fontFamily: 'fontL',
                        fontSize: 12.sp,
                        color: AppColors.defaultTextColor,
                        letterSpacing: -0.05.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                  ],
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: 1.sw,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontFamily: 'fontR',
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
    );
  }
}
